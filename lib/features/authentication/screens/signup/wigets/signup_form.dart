import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/features/authentication/controllers/signup/signup_controller.dart';
import 'package:myapp/features/authentication/screens/signup/wigets/term_condition_chechbox.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/validation/validators.dart';

class MSignupForm extends StatelessWidget {
  const MSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///first & last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      MValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      MValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          ///username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                MValidator.validateEmptyText('User name', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          ///email
          TextFormField(
            controller: controller.email,
            validator: (value) => MValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: MTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          ///phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => MValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: MTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          ///password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => MValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: MTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          ///terms & conditions
          const MTermsAndConditionsCheckbox(),
          const SizedBox(height: MSizes.spaceBtwSections),

          ///signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(MTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}