import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/images/rounded_images.dart';
import 'package:myapp/common/widgets/products/product%20cards/product_cart_horizontal.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const MRoundedImage(
                  imageUrl: MImages.promoBanner4,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///sub categories
              Column(
                children: [
                  ///heading
                  MSectionHeading(title: 'Sports shirts', onPressed: () {}),
                  const SizedBox(height: MSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder:  (context, index) => const SizedBox(width: MSizes.spaceBtwItems),
                        itemBuilder: (context, index) => const MProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}