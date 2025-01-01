import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/repositories/authentication_repository.dart';
import 'package:myapp/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        //padding to give default equal space on all sides of screens
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(MImages.deliveredEmailIllustration),
                width: MHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///title & subtitle
              Text(MTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwItems),
              Text(MTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(MTexts.tContinue)),
              ),
              const SizedBox(height: MSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(MTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
