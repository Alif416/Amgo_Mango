import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/repositories/authentication_repository.dart';
import 'package:myapp/data/repositories/user_repository.dart';
import 'package:myapp/features/authentication/screens/signup/verify_email.dart';
import 'package:myapp/features/personalization/models/user_model.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/helpers/loaders.dart';
import 'package:myapp/utils/helpers/network_manager.dart';
import 'package:myapp/utils/popups/full_screen_loader.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs; //observable for hiding/showing password
  final privacyPolicy = true.obs; //observable for privacy policy acceptance
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for lastname input
  final username = TextEditingController(); //controller for username input
  final password = TextEditingController(); //controller for password input
  final firstName = TextEditingController(); //controller for firstname input
  final phoneNumber =
  TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //form key for form validation

  ///Sign up
  void signup() async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          'We are processing your information...', MImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        MFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove loader
        MFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        MLoaders.warningSnackBar(
          title: 'Accept privacy policy',
          message:
              'In order to create an account you must accept privacy policy & terms of use',
        );
        return;
      }

      // register user in the firebase authentication and save user details in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated new data in firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      MFullScreenLoader.stopLoading();


      // show success snack bar
      MLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created verify email to continue');

      // move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      //remove loader
      MFullScreenLoader.stopLoading();

      //show some generic error to the user
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      
    }
  }
}