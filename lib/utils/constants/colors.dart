import 'package:flutter/material.dart';

class MColors {
  MColors._();

  // Basic Colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.green;
  static const Color accentColor = Colors.orange;
  static const Color warningColor = Colors.red;

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [Colors.blue, Colors.blueAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient secondaryGradient = LinearGradient(
    colors: [Colors.green, Colors.greenAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text Colors
  static const Color lightTextColor = Colors.black;
  static const Color darkTextColor = Colors.white;

  // Background Colors
  static const Color lightBackgroundColor = Colors.white;
  static const Color darkBackgroundColor = Colors.black;

  // Additional Colors
  static const Color infoColor = Colors.lightBlue;
  static const Color successColor = Colors.green;
  static const Color errorColor = Colors.red;
  static const Color hintTextColor = Colors.grey;

  // Social Media Colors (example)
  static const Color facebookColor = Color(0xFF3b5998);
  static const Color linkedinColor = Color(0xFF0e76a8);
}
