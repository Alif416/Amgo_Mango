import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/brands/brands_card.dart';
import 'package:myapp/common/widgets/layout/grid_layout.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/shop/screens/brand/brand_products.dart';
import 'package:myapp/utils/constants/sizes.dart';


class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///--heading
              const MSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItems),

              ///--brands
              MGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => MBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}