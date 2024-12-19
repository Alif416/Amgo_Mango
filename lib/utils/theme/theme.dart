import 'package:flutter/material.dart';
import 'package:myapp/utils/theme/custom_themes/elevatedbutton_theme.dart';
import 'package:myapp/utils/theme/custom_themes/text_theme.dart';

class MAppTheme {
  MAppTheme._();
}

static ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor:Colors.white ,
  elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
  textTheme: MTextTheme.lightTextTheme,

);

static ThemeData darkTheme = ThemeData(

  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor:Colors.white ,
  elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
  textTheme: MTextTheme.darkTextTheme,


);