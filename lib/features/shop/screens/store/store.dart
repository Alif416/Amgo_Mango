import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/appbar/tabbar.dart';
import 'package:myapp/common/widgets/brands/brands_card.dart';
import 'package:myapp/common/widgets/layout/grid_layout.dart';
import 'package:myapp/common/widgets/shapes/containers/search_container.dart';
import 'package:myapp/common/widgets/texts/section_heading.dart';
import 'package:myapp/features/shop/controllers/category_controller.dart';
import 'package:myapp/features/shop/screens/brand/all_brands.dart';
import 'package:myapp/features/shop/screens/store/widgets/category_tab.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
           // MCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: MHelperFunctions.isDarkMode(context)
                        ? MColors.black
                        : MColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(MSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: MSizes.spaceBtwItems),
                          const MSearchContainer(
                              text: 'Search in store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: MSizes.spaceBtwSections),

                          ///- featured brands
                          MSectionHeading(
                              title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                          const SizedBox(height: MSizes.spaceBtwItems / 1.5),

                          MGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const MBrandCard(showBorder: false);
                              })
                        ],
                      ),
                    ),

                    ///tabs
                    bottom:  MTabBar(
                        tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                    ),
                ),
              ];
            },
           body: TabBarView(
                children: categories.map((category) => MCategoryTab(category: category)).toList()
            ),
        ),
      ),
    );
  }
}


