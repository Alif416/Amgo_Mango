import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/products/cart/add_remove_button.dart';
import 'package:myapp/common/widgets/texts/product_price_text.dart';
import 'package:myapp/utils/constants/sizes.dart';



class MCartItems extends StatelessWidget {
  const MCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: MSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const MCartItems(),
          if(showAddRemoveButtons) const SizedBox(height: MSizes.spaceBtwItems),

          ///add remove row buttons with price
          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///extra space
                  SizedBox(width: 70),

                  ///add remove button
                  MProductQuantityWithAddRemoveButton(),
                ],
              ),
              MProductPriceText(price: '256')
            ],
          ),
        ],
      ),
    );
  }
}