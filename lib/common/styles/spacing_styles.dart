import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: MSize.appBarHeight,
    left: MSize.defaultSpace,
    right: MSize.defaultSpace,
    bottom: MSize.defaultSpace,
  );
}
