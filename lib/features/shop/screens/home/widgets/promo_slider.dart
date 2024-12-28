import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/images/rounded_images.dart';
import 'package:myapp/common/widgets/loaders/shimmer.dart';
import 'package:myapp/common/widgets/shapes/containers/circular_container.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class MPromoSlider extends StatelessWidget {
  const MPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        () {
          //loader
          if(controller.isLoading.value) return const MShimmerEffect(width: double.infinity, height: 180);

          //no data found
          if (controller.banners.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index)),
                  items: controller.banners
                      .map((banner) => MRoundedImage(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: true,
                    onPressed: () => Get.toNamed(banner.targetScreen),
                  ))
                      .toList(),
                ),
                const SizedBox(height: MSizes.spaceBtwItems),
                Center(
                  child: Obx(
                        () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          MCircularContainer(
                            margin: const EdgeInsets.only(right: 10),
                            width: 20,
                            height: 4,
                            backgroundColor: controller.carouselCurrentIndex.value == i
                                ? MColors.primary
                                : MColors.grey,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

        }
    );
  }
}