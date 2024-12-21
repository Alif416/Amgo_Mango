import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: MDeviceUtils.getAppBarHeight(),
    right: MSize.fontSizeExtraLarge,
    child: TextButton(onPressed: ()=>OnBoardingController.instance.skipPage(),
     child: const Text('Skip')),
          );
  }
}