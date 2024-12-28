import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/repositories/user_repository.dart';
import 'package:myapp/features/personalization/controllers/user_controller.dart';
import 'package:myapp/features/personalization/screens/profile/profile.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/helpers/network_manager.dart';
import 'package:myapp/utils/popups/full_screen_loader.dart';

import '../../../utils/helpers/loaders.dart';

///controller to manage user related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>(); //form key for form validation


  ///init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try{
      //start loading
      MFullScreenLoader.openLoadingDialog('We are updating your information...', MImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        MFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        //remove loader
        MFullScreenLoader.stopLoading();
        return;
      }

      //update user's first & last name in firebase firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      //Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      MFullScreenLoader.stopLoading();


      // show success snack bar
      MLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      //move to previous screen
      Get.off(() => const ProfileScreen());

    } catch (e) {
      //remove loader
      MFullScreenLoader.stopLoading();

      //show some generic error to the user
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}