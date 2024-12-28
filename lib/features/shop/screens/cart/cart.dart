
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:myapp/features/shop/screens/checkout/checkout.dart';
import 'package:myapp/utils/constants/sizes.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(MSizes.defaultSpace),

        ///items in cart
        child: MCartItems()
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256')),
      ),
    );
  }
}