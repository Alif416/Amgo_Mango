import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/images/circular_image.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/texts/m_brand_title_text_with_veri.dart';
import 'package:myapp/common/widgets/texts/product_price_text.dart';
import 'package:myapp/common/widgets/texts/product_title_text.dart';
import 'package:myapp/features/shop/controllers/product_controller.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/enums.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class MProductMetaData extends StatelessWidget {
  const MProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price & sale price
        Row(
          children: [
            ///Sale Tag
            MRoundedContainer(
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
            const SizedBox(width: MSizes.spaceBtwItems),
            ///price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: MSizes.spaceBtwItems),
            MProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        ///title
        MProductTitleText(title: product.title),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(
          children: [
            const MProductTitleText(title: 'Status'),
            const SizedBox(width: MSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),
        
        ///brand
        Row(
          children: [
            MCircularImage(
                image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: darkMode ? MColors.white : MColors.black,
            ),
            MBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
  
  
  
  
  }