import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MHomeAppBar extends StatelessWidget { // Corrected class name
  const MHomeAppBar({super.key}); // Added missing semicolon

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: MColors.grey),
          ),
        ],
      ),
      actions: const [],
    );
  }
}
