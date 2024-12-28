import 'package:flutter/material.dart';
import 'package:myapp/utils/theme/custom_themes/appbar_theme.dart';
import 'package:myapp/utils/theme/custom_themes/chip_theme.dart';
import 'package:myapp/utils/theme/custom_themes/elevatedbutton_theme.dart';
import 'package:myapp/utils/theme/custom_themes/text_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/cheakbox_theme.dart';
import 'custom_themes/outlined_theme.dart';
import 'custom_themes/text_field_theme.dart';

class MAppTheme{
  MAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MTextTheme.lightTextTheme,
    chipTheme: MChipTheme.lightChipTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MAppBarTheme.lightAppBarTheme,
    checkboxTheme: MCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: MTextTheme.darkTextTheme,
      chipTheme: MChipTheme.darkChipTheme,
      elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: MAppBarTheme.darkAppBarTheme,
    checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
  );
}