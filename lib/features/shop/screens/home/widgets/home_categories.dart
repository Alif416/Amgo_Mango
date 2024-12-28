import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/image_text_widgets/vertical_image.dart';
import 'package:myapp/common/widgets/loaders/category_shimmer.dart';
import 'package:myapp/features/shop/controllers/category_controller.dart';
import 'package:myapp/features/shop/screens/sub_category/sub_category.dart';




class MHomeCategories extends StatelessWidget {
  const MHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if(categoryController.isLoading.value) return const MCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return MVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        );
      }
    );
  }
}