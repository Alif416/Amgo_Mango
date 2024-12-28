import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/shapes/containers/search_container.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/shop/screens/all_products/all_products.dart';
import 'package:myapp/features/shop/screens/home/widgets/home_categories.dart';
import 'package:myapp/features/shop/screens/home/widgets/m_home_appbar.dart';
import 'package:myapp/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:myapp/utils/constants/sizes.dart';
import '../../../../common/widgets/shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            const MPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  MHomeAppBar(),
                  SizedBox(height: MSizes.spaceBtwSections),

                  ///searchbar
                  MSearchContainer(text: 'Search in store'),
                  SizedBox(height: MSizes.spaceBtwSections),

                  ///categories
                  Padding(
                    padding: EdgeInsets.only(left: MSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///heading of categories
                        MSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: MSizes.spaceBtwItems),

                        ///categories
                        MHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: MSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  const MPromoSlider(),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  ///-heading
                  MSectionHeading(title: 'Popular products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: MSizes.spaceBtwItems),

                  // ///popular products
                  // Obx(() {
                  //   if(controller.isLoading.value) return const MVerticalProductShimmer();
                  //   if(controller.featuredProducts.isEmpty){
                  //     return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium));
                  //   }
                  //   return MGridLayout(
                  //       itemCount: controller.featuredProducts.length,
                  //       itemBuilder: (_, index) =>  MProductCardVertical(product: controller.featuredProducts[index]));
                  // } ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}