import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/styles/shadows.dart';
import 'package:myapp/common/widgets/images/rounded_images.dart';
import 'package:myapp/common/widgets/texts/m_brand_title_text_with_veri.dart';
import 'package:myapp/common/widgets/texts/product_price_text.dart';
import 'package:myapp/common/widgets/texts/product_title_text.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/features/shop/screens/products_details/product_details.dart';
import 'package:myapp/utils/constants/enums.dart';
import '../../../../features/shop/controllers/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';
import '../../shapes/containers/rounded_container.dart';


class MProductCardVertical extends StatelessWidget {
  const MProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = MHelperFunctions.isDarkMode(context);

    /// container with  side paddings,color,edges,radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          color: dark ? MColors.darkerGrey : MColors.white,
        ),
        child: Column(
          children: [
            ///thumbnail,wishlist button, discount tag
            MRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  ///thumbnail image
                   Center(
                     child: MRoundedImage(
                        imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                   ),

                  ///sale tag
                  Positioned(
                    top: 12,
                    child: MRoundedContainer(
                      radius: MSizes.sm,
                      backgroundColor: MColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: MSizes.sm, vertical: MSizes.xs),
                      child: Text('$salePercentage%',
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
            const SizedBox(height: MSizes.spaceBtwItems / 2),

            /// -- details
            Padding(
              padding: const EdgeInsets.only(left: MSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MProductTitleText(
                      title: product.title, smallSize: true),
                  const SizedBox(height: MSizes.spaceBtwItems / 2),
                  MBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : ''),
                ],
              ),
            ),
            const Spacer(),

            ///Price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: MSizes.sm),
                          child:  Text(
                              product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ///price, show sale price as main price if sale exists
                      Padding(
                        padding: const EdgeInsets.only(left: MSizes.sm),
                        child:  MProductPriceText(price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                ///add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: MColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MSizes.cardRadiusMd),
                        bottomRight:
                        Radius.circular(MSizes.productImageRadius)),
                  ),
                  child: const SizedBox(
                      width: MSizes.iconLg * 1.2,
                      height: MSizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add, color: MColors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}