import 'package:flutter/material.dart';
import 'package:myapp/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:myapp/utils/theme/custom_themes/cheakbox_theme.dart';
import 'package:myapp/utils/theme/custom_themes/chip_theme.dart';
import 'package:myapp/utils/theme/custom_themes/elevatedbutton_theme.dart';
import 'package:myapp/utils/theme/custom_themes/outlined_theme.dart';
import 'package:myapp/utils/theme/custom_themes/text_field_theme.dart';
import 'package:myapp/utils/theme/custom_themes/text_theme.dart';


class MAppTheme {
  MAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    textTheme: MTextTheme.lightTextTheme,
    checkboxTheme: MCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    chipTheme: MChipTheme.lightChipTheme,
    inputDecorationTheme: MTextFieldTheme.lightTextFieldTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    textTheme: MTextTheme.darkTextTheme,
    checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    chipTheme: MChipTheme.darkChipTheme,
    inputDecorationTheme: MTextFieldTheme.darkTextFieldTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
  );
}

