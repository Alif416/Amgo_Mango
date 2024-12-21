// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/device/device_utility.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              OnBoardingPage(
                image: MImages.onBoardingImage1,
                title: MTextStrings.onBoardingTitle1,
                subTitle: MTextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage1,
                title: MTextStrings.onBoardingTitle2,
                subTitle: MTextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage1,
                title: MTextStrings.onBoardingTitle3,
                subTitle: MTextStrings.onBoardingSubTitle3,
              ),
            ],
          ),

          // skip
          const OnBoardingSkip(),

          // Dot navigation design
          OnBoardingDotNavigation(controller: controller),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
      right: MSize.defaultSpace,
      bottom: MDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark? MColors.primaryColor:Colors.black
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
