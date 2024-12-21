import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: MDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: MSize.defaultSpace,
      right: MSize.defaultSpace,
      child: Center(
        child: SmoothPageIndicator(
         
          count: 3,
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.black,
            dotHeight: 6,
          ),
        ),
      ),
    );
  }
}