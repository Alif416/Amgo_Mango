import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/utils/constants/sizes.dart';


class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--appbar
      appBar: const MAppBar(title: Text('Ratings & Reviews'), showBackArrow: true),

      ///--body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings & Reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: MSizes.spaceBtwItems),

              ///overall product ratings
              //const MOverallProductRating(),
              //const RatingBarIndicator(rating: 3.5),
              Text('12.611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///user review list
            //   const UserReviewCard(),
            //   const UserReviewCard(),
            //   const UserReviewCard(),
            ]// ],
          ),
        ),
      ),
    );
  }
}