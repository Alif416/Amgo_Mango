import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/features/shop/screens/products_details/widgets/bottom_add_to_cart.dart';
import 'package:myapp/features/shop/screens/products_details/widgets/product_attributes.dart';
import 'package:myapp/features/shop/screens/products_details/widgets/product_image_detail_slider.dart';
import 'package:myapp/features/shop/screens/products_details/widgets/product_meta.dart';
import 'package:myapp/features/shop/screens/products_details/widgets/rating_share_widget.dart';
import 'package:myapp/features/shop/screens/products_reviews/product_reviews.dart';
import 'package:myapp/utils/constants/enums.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1- product image slider
             MProductImageSlider(product: product),
            
            ///2- product details
            Padding(
              padding: const EdgeInsets.only(right: MSizes.defaultSpace, left: MSizes.defaultSpace, bottom: MSizes.defaultSpace),
              child: Column(
                children: [
                  ///Rating & share button
                  const MRatingAndShare(),

                  ///Price,title,stock & brand
                  MProductMetaData(product: product),

                  ///Attributes
                  if(product.productType == ProductType.variable.toString()) MProductAttributes(product: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: MSizes.spaceBtwSections),

                  ///checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  ///description
                  const MSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? 'Description is empty',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  ///reviews
                  const Divider(),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections),
                ],
              ),

            )
          ],


        ),
      ),
    );
  }
}