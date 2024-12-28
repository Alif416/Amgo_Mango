import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/texts/m_brand_title_text_with_veri.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_images.dart';
import '../../texts/product_title_text.dart';


class MCartItem extends StatelessWidget {
  const MCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        MRoundedImage(
          imageUrl: MImages.productImage1,
          width: 60,
          height: 60,
          backgroundColor: MHelperFunctions.isDarkMode(context) ? MColors.darkGrey : MColors.light,
          padding: const EdgeInsets.all(MSizes.sm),
        ),
        const SizedBox(width: MSizes.spaceBtwItems),

        ///title,price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child:  MProductTitleText(title: 'Black sports shoes', maxLines: 1)),
              ///attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 38', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}