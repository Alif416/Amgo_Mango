import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/shapes/containers/rounded_container.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';



class MCouponCode extends StatelessWidget {
   const  MCouponCode({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return MRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? MColors.dark : MColors.white,
      padding: const EdgeInsets.only(
          top: MSizes.sm,
          bottom: MSizes.sm,
          right: MSizes.sm,
          left: MSizes.md),
      child: Row(
        children: [
          ///TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code ? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          ///Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? MColors.white.withOpacity(0.5) : MColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}