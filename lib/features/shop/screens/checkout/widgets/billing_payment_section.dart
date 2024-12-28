import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class  MBillingPaymentSection extends StatelessWidget {
  const MBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        MSectionHeading(title: 'Payment Methods', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          children: [
            MRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? MColors.light : MColors.white,
              padding: const EdgeInsets.all(MSizes.sm),
              child: const Image(image: AssetImage(MImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            Text(' Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}