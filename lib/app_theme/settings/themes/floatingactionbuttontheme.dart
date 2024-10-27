import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';

class FloatingActionbuttonTheme {
  
  FloatingActionbuttonTheme._();

  static FloatingActionButtonThemeData lightmode =
   FloatingActionButtonThemeData(
    backgroundColor: SAcolors.primaryColor,
    foregroundColor: SAcolors.white
    );

  static FloatingActionButtonThemeData darkmode =
    FloatingActionButtonThemeData(
    backgroundColor:SAcolors.primaryColor,
    foregroundColor: SAcolors.white
    );
}
