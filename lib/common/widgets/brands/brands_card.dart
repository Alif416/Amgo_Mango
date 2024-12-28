import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/images/circular_image.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/texts/m_brand_title_text_with_veri.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/enums.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';



class MBrandCard extends StatelessWidget {
  const MBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      ///container design
      child: MRoundedContainer(
        padding: const EdgeInsets.all(MSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///icon
            Flexible(
              child: MCircularImage(
                isNetworkImage: false,
                image: MImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark
                    ? MColors.white
                    : MColors.black,
              ),
            ),
            const SizedBox(
                width: MSizes.spaceBtwItems / 2),

            ///Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const MBrandTitleWithVerifiedIcon(
                      title: 'Nike',
                      brandTextSize: TextSizes.large),
                  Text(
                    '25 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}