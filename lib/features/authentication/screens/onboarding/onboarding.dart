import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart';
import 'package:myapp/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding.controller.dart';

import 'widget/onboarding_next.dart';
import 'widget/onboarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: MImages.onBoardingImage1,
                  title: MTexts.onBoardingTitle1,
                  subTitle: MTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: MImages.onBoardingImage2,
                  title: MTexts.onBoardingTitle2,
                  subTitle: MTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: MImages.onBoardingImage3,
                  title: MTexts.onBoardingTitle3,
                  subTitle: MTexts.onBoardingSubTitle3),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation smooth page indicator
          const OnBoardingNavigation(),

          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
