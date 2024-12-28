import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/styles/spacing_styles.dart';
import 'package:myapp/common/widgets/login_signup/form_divider.dart';
import 'package:myapp/common/widgets/login_signup/social_buttons.dart';
import 'package:myapp/features/authentication/screens/login/widgets/login_form.dart';
import 'package:myapp/features/authentication/screens/login/widgets/login_header.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///logo,title,subtitle
              const MLoginHeader(),

              ///form
              const MLoginForm(),

              ///Divider
              MFormDivider(dividerText: MTexts.orSignInWith.capitalize!),
              const SizedBox(height: MSizes.spaceBtwSections),


              ///footer
              const MSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}