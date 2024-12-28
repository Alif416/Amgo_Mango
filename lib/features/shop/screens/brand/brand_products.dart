import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/brands/brands_card.dart';
import 'package:myapp/common/widgets/products/sortable/sortable_products.dart';
import 'package:myapp/utils/constants/sizes.dart';


class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///brand detail
              MBrandCard(showBorder: true),
              SizedBox(height: MSizes.spaceBtwSections),

              MSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}