import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/icon/circular_icon.dart';
import 'package:myapp/common/widgets/images/rounded_images.dart';
import 'package:myapp/common/widgets/shapes/curved_edges/curved_edges_widget.dart';
import 'package:myapp/features/shop/controllers/images_controller.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class MProductImageSlider extends StatelessWidget {
  const MProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    final dark = MHelperFunctions.isDarkMode(context);
    return MCurvedEdgeWidget(
      child: Container(
        color: dark ? MColors.darkerGrey : MColors.light,
        child: Stack(
          children: [
            ///main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(MSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: MColors.primary)),
                  );
                })),
              ),
            ),

            ///image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: MSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: MSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return MRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? MColors.dark : MColors.white,
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        border: Border.all(
                            color: imageSelected
                                ? MColors.primary
                                : Colors.transparent),
                        padding: const EdgeInsets.all(MSizes.sm),
                        imageUrl: images[index]);
                  }),
                ),
              ),
            ),

            ///appbar icons
            const MAppBar(
              showBackArrow: true,
              actions: [
                MCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}






