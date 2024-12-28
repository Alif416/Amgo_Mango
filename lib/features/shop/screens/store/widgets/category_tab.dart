import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/layout/grid_layout.dart';
import 'package:myapp/common/widgets/products/product%20cards/product_card_vertical.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/shop/models/category_model.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/utils/constants/sizes.dart';


class MCategoryTab extends StatelessWidget {
  const MCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            ///--brands
            //const MBrandShowcase(images: [MImages.productImage3, MImages.productImage2, MImages.productImage1],),
            //const MBrandShowcase(images: [MImages.productImage3, MImages.productImage2, MImages.productImage1],),
            const SizedBox(height: MSizes.spaceBtwItems),

            ///--products
            MSectionHeading(title: 'You might like', showActionButton: true, onPressed: (){},),
            const SizedBox(height: MSizes.spaceBtwItems),

            MGridLayout(itemCount: 4, itemBuilder: (_, index) =>  MProductCardVertical(product: ProductModel.empty())),
            const SizedBox(height: MSizes.spaceBtwSections),
          ],
        ),
      ),]
    );
  }
}