import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

class MHelperFunctions {
  MHelperFunctions._();

  // Function to get color by name
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'brown':
        return Colors.brown;
      case 'grey':
      case 'gray':
        return Colors.grey;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      default:
        return null; // Return null if color name is not recognized
    }
  }

  // Function to get screen width
  static double getscreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Function to get screen height
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static isDarkMode(BuildContext context) {}
}
