import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/data/repositories/authentication_repository.dart';
import 'package:myapp/data/repositories/user_repository.dart';
import 'package:myapp/features/authentication/screens/login/login.dart';
import 'package:myapp/features/personalization/models/user_model.dart';
import 'package:myapp/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/loaders.dart';
import 'package:myapp/utils/helpers/network_manager.dart';
import 'package:myapp/utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.put(UserController());

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //first update rx user and then check if user details is already stored. if not store new data
      await fetchUserRecord();

      //if no record is stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //convert name to first name and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      MLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information.You can re-save your data in your profile');
    }
  }

  ///delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? this action is not reversible and all your data will be lost',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
              child: Text('Delete'))),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  ///delete user account
  void deleteUserAccount() async {
    try {
      MFullScreenLoader.openLoadingDialog('Processing', MImages.docerAnimation);

      ///first re authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // re verify with email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          MFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          MFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      //remove loader
      MFullScreenLoader.stopLoading();

      //show some generic error to the user
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///-- re authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      MFullScreenLoader.openLoadingDialog('Processing', MImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        MFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!reAuthFormKey.currentState!.validate()) {
        //remove loader
        MFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      MFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      //remove loader
      MFullScreenLoader.stopLoading();

      //show some generic error to the user
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///upload profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        //upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        MLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile has been updated!');
      }
    } catch (e) {
      MLoaders.errorSnackBar(
          title: 'Oh snap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
