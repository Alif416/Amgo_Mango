import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/loaders/shimmer.dart';
import 'package:myapp/utils/constants/sizes.dart';


class MCategoryShimmer extends StatelessWidget {
  const MCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: MSizes.spaceBtwItems),
        itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///image
                MShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(width: MSizes.spaceBtwItems / 2),

                ///text
                MShimmerEffect(width: 55, height: 8),
              ],
            );
        }
      ),
    );
  }
}