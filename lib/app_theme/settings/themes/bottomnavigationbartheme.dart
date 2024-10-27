import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';


class BottomnavigationbarTheme {
  BottomnavigationbarTheme._();

  static BottomNavigationBarThemeData lightmode = BottomNavigationBarThemeData(
    backgroundColor: SAcolors.white,
    selectedItemColor: SAcolors.primaryColor,
    unselectedItemColor: SAcolors.grey,
  );


    static BottomNavigationBarThemeData darkmode = BottomNavigationBarThemeData(
    backgroundColor: SAcolors.black,
    selectedItemColor: SAcolors.primaryColor,
    unselectedItemColor: SAcolors.grey,
  );
}
