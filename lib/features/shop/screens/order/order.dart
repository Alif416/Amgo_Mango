import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/appbar/appbar.dart';
import 'package:myapp/features/shop/screens/order/widgets/order_list.dart';
import 'package:myapp/utils/constants/sizes.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--Appbar
      appBar: MAppBar(title: Text('My orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),

        ///--Orders
        child: MOrderListItems(),
      ),
    );
  }
}