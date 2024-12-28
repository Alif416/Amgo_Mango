import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'wigets/signup_form.dart';


class SignupScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(MTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///form
              const MSignupForm(),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///divider
              MFormDivider(dividerText: MTexts.orSignUpWith.capitalize!),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///social buttons
              const MSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}