import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/features/personalization/controllers/user_controller.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/validation/validators.dart';


class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate-user')),
      body:  SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: MValidator.validateEmail,
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: MTexts.email),
                  ),
                  const SizedBox(height: MSizes.spaceBtwInputFields),

                  ///password
                  TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => MValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                        labelText: MTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash))
                        ),
                  ),

                  const SizedBox(height: MSizes.spaceBtwSections),

                  ///save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}