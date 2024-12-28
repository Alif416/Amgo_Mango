import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/features/personalization/controllers/update_name_controller.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/validation/validators.dart';


class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      ///custom appbar
      appBar: MAppBar(
        showBackArrow: true,
        title: Text('Change name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///headings
            Text('Use real name for verification', style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: MSizes.spaceBtwSections),

            ///text field and button
            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => MValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: MTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: MSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => MValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: MTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )
            ),
            const SizedBox(height: MSizes.spaceBtwSections),

            ///save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}