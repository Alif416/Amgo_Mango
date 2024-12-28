
import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/chips/choice_chip.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/texts/product_price_text.dart';
import 'package:myapp/common/widgets/texts/product_title_text.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MProductAttributes extends StatelessWidget {
  const MProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///selected attribute pricing & description
        MRoundedContainer(
          padding: const EdgeInsets.all(MSizes.md),
          backgroundColor: dark ? MColors.darkerGrey : MColors.grey,
          child: Column(
            children: [
              ///title,price and stock status
              Row(
                children: [
                  const MSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: MSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const MProductTitleText(
                              title: 'Price : ', smallSize: true),
                          const SizedBox(width: MSizes.spaceBtwItems),

                          ///actual price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: MSizes.spaceBtwItems),

                          ///sale price
                          const MProductPriceText(price: '20'),
                        ],
                      ),

                      ///stack
                      Row(
                        children: [
                          const MProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              ///variable description
              const MProductTitleText(
                title:
                    'This is the description of the product and it can open up to  max 4 times',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: MSizes.spaceBtwItems),

        ///attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MSectionHeading(title: attribute.name ?? '', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: attribute.values!.map((value) =>
                    MChoiceChip(text: value, selected: false, onSelected: (value){}),).toList(),

                  

              )
            ],
          ),).toList(),

        )



      ],
    );
  }
}
