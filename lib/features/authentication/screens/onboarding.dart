// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image(
                    width: MHelperFunctions.screenWidth() * 0.8,
                    height: MHelperFunctions.screenHeight() * 0.6,
                    image: AssetImage(MImages.onBoardingImage1),
                  ),
                  Text(
                    'Welcome to Amgo Mango',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: MSize.fontSizeMedium),
                  Text(
                    'Get Your Desired Product Here',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
