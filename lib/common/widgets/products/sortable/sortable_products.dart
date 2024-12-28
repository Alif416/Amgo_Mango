import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/layout/grid_layout.dart';
import 'package:myapp/common/widgets/products/product%20cards/product_card_vertical.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/utils/constants/sizes.dart';


class MSortableProducts extends StatelessWidget {
  const MSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///dropdown
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher price',
            'Lower price',
            'Sale',
            'New',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
              value: option,
              child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: MSizes.spaceBtwSections),
        ///products
        MGridLayout(itemCount: 8, itemBuilder: (_, index) => MProductCardVertical(product: ProductModel.empty())),
      ],
    );
  }
}