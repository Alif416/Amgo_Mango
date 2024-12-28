import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/repositories/authentication_repository.dart';
import 'package:myapp/features/authentication/screens/password%20configuration/reset_password.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/helpers/loaders.dart';
import 'package:myapp/utils/helpers/network_manager.dart';
import 'package:myapp/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///send reset password email
  sendPasswordResetEmail() async {
    try{

      //start loading
      MFullScreenLoader.openLoadingDialog('Processing your request...', MImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if(!forgetPasswordFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      //send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //remove loader
      MFullScreenLoader.stopLoading();

      //show success screen
      MLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to reset your password'.tr);

      //redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //remove loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{

      //start loading
      MFullScreenLoader.openLoadingDialog('Processing your request...', MImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MFullScreenLoader.stopLoading();
        return;
      }


      //send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove loader
      MFullScreenLoader.stopLoading();

      //show success screen
      MLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to reset your password'.tr);



    } catch (e) {
      //remove loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}