import 'package:flutter/material.dart';

class MChipTheme {
  MChipTheme._();

  static final lightChipTheme = ChipThemeData(
    backgroundColor: Colors.white,
    disabledColor: Colors.grey[300],
    selectedColor: Colors.blue,
    secondarySelectedColor: Colors.blueAccent,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.blue),
    ),
    labelStyle: const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w600,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.blueAccent,
      fontWeight: FontWeight.w600,
    ),
    brightness: Brightness.light,
  );

  static final darkChipTheme = ChipThemeData(
    backgroundColor: Colors.black,
    disabledColor: Colors.grey[800],
    selectedColor: Colors.blue,
    secondarySelectedColor: Colors.blueAccent,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.white),
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    secondaryLabelStyle: const TextStyle(
      color: Colors.blueAccent,
      fontWeight: FontWeight.w600,
    ),
    brightness: Brightness.dark,
  );
}

