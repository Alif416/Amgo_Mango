import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/icon/circular_icon.dart';
import 'package:myapp/common/widgets/layout/grid_layout.dart';
import 'package:myapp/common/widgets/products/product%20cards/product_card_vertical.dart';
import 'package:myapp/features/shop/models/product_model.dart';
import 'package:myapp/features/shop/screens/home/home.dart';
import 'package:myapp/utils/constants/sizes.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          MCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),

          ///products grid
          child: MGridLayout(
              itemCount: 6,
              itemBuilder: (_, index) => MProductCardVertical(product: ProductModel.empty())),
        ),
      ),
    );
  }
}