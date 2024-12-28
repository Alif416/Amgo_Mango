import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class MLoginHeader extends StatelessWidget {
  const MLoginHeader({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? MImages.appLogoLight : MImages.appLogoDark),),
        Text(MTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: MSizes.sm),
        Text(MTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}