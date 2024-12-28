import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/texts/m_brand_title_text_with_veri.dart';
import 'package:myapp/common/widgets/texts/product_price_text.dart';
import 'package:myapp/common/widgets/texts/product_title_text.dart';
import 'package:myapp/utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';
import '../../images/rounded_images.dart';
import '../../shapes/containers/rounded_container.dart';

class MProductCardHorizontal extends StatelessWidget {
  const MProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MSizes.productImageRadius),
        color: dark ? MColors.darkerGrey : MColors.softGrey,
      ),
      child: Row(
        children: [
          ///thumbnail
          MRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(MSizes.sm),
            backgroundColor: dark ? MColors.dark : MColors.light,
            child:  Stack(
              children: [
                ///thumbnail image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: MRoundedImage(
                      imageUrl: MImages.productImage1, applyImageRadius: true),
                ),

                ///sale tag
                Positioned(
                  top: 12,
                  child: MRoundedContainer(
                    radius: MSizes.sm,
                    backgroundColor: MColors.secondary.withOpacity(0.8),
                    padding:  const EdgeInsets.symmetric(
                        horizontal: MSizes.sm, vertical: MSizes.xs),
                    child: Text('25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: MColors.black)),
                  ),
                ),

                ///favorite icon button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: MCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          ///details
           SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: MSizes.sm, top: MSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true),
                      SizedBox(height: MSizes.spaceBtwItems / 2),
                      MBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///pricing
                      const Flexible(child: MProductPriceText(price: '256.0')),

                      ///add to cart button
                      Container(
                        decoration:  const BoxDecoration(
                          color: MColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(MSizes.cardRadiusMd),
                              bottomRight:
                              Radius.circular(MSizes.productImageRadius)),
                        ),
                        child:  const SizedBox(
                            width: MSizes.iconLg * 1.2,
                            height: MSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: MColors.white))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}