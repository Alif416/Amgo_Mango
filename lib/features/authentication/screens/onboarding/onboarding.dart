import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_next.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
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

          // Skip button
          const OnBoardingSkip(),

          // Dot navigation design
          OnBoardingDotNavigation(controller: controller.pageController),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
