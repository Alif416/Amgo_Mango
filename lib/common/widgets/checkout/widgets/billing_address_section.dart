import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/utils/constants/sizes.dart';


class MBillingAddressSection extends StatelessWidget {
  const MBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Coding with T', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: MSizes.spaceBtwItems),
            Text('+237671092331', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: MSizes.spaceBtwItems),
            Expanded(child: Text('540,warren rd, apt 4, Ithaca,NY', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
      ],
    );
  }
}