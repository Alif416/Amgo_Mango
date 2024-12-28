import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/common/widgets/products/cart/coupon_widget.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/success_screen/success_screen.dart';
import 'package:myapp/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:myapp/features/shop/screens/checkout/widgets/billing_addresss_section.dart';
import 'package:myapp/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:myapp/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:myapp/navigation_menu.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///--items in cart
              const MCartItems(showAddRemoveButtons: false),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///--coupon field
              const MCouponCode(),
              const SizedBox(height: MSizes.spaceBtwSections),

              ///Billing section
              MRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(MSizes.md),
                backgroundColor: dark ? MColors.black : MColors.white,
                child: const Column(
                  children: [
                    ///pricing
                    MBillingAmountSection(),
                    SizedBox(height: MSizes.spaceBtwItems),

                    ///divider
                    Divider(),
                    SizedBox(height: MSizes.spaceBtwItems),

                    ///payment methods
                    MBillingPaymentSection(),
                    SizedBox(height: MSizes.spaceBtwItems),

                    ///address
                    MBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: MImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon.',
                onPressed: () => Get.offAll(() => const NavigationMenu())
            ),
            ),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}