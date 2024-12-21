import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/device/device_utility.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

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
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark? MColors.primaryColor:Colors.black
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
