
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class MSingleAddress extends StatelessWidget {
  const MSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return MRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(MSizes.md),
      backgroundColor: selectedAddress
          ? MColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent :
      dark ? MColors.darkerGrey : MColors.grey,
      margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? MColors.light : MColors.dark : null,

            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ryan Franklin',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: MSizes.sm / 2),
              const Text('(+123) 456 7898', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: MSizes.sm / 2),
              const Text('540 Warren rd, Ithaca New York,USA,Apt4', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}






