import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class MOrderListItems extends StatelessWidget {
  const MOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: MSizes.spaceBtwItems),
      itemBuilder: (_, index) => MRoundedContainer(
        padding: const EdgeInsets.all(MSizes.md),
        showBorder: true,
        backgroundColor: dark ? MColors.dark : MColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///--row1
            Row(
              children: [
                ///1-icon
                const Icon(Iconsax.ship),
                const SizedBox(width: MSizes.spaceBtwItems / 2),

                ///2-status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.primary, fontWeightDelta: 1),
                      ),
                      Text('26 JAN 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                ///3- icon
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: MSizes.iconSm)
                ),
              ],
            ),

            const SizedBox(height: MSizes.spaceBtwItems),


            ///--row2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///1-icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: MSizes.spaceBtwItems / 2),

                      ///2-status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      ///1-icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: MSizes.spaceBtwItems / 2),

                      ///2-status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('31 JAN 2024', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}