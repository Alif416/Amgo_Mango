import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/controllers/onboarding.controller.dart';

import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/device/device_utility.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return Positioned(
      right: MSizes.defaultSpace,
      bottom: MDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.black),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
