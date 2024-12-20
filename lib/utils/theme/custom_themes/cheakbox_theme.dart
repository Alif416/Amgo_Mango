import 'package:flutter/material.dart';

class MCheckboxTheme {
  MCheckboxTheme._();

  static CheckboxThemeData get lightCheckboxTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    side: const BorderSide(color: Colors.blue),
    fillColor: WidgetStateProperty.all(Colors.blue),
    checkColor: WidgetStateProperty.all(Colors.white),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.blue.withOpacity(0.54);
      }
      return null;
    }),
  );

  static CheckboxThemeData get darkCheckboxTheme => CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    side: const BorderSide(color: Colors.white),
    fillColor: WidgetStateProperty.all(Colors.blue),
    checkColor: WidgetStateProperty.all(Colors.white),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white.withOpacity(0.54);
      }
      return null;
    }),
  );
}

