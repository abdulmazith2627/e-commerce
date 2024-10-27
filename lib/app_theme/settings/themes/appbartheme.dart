import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';


class Appbartheme {
  Appbartheme._();

  static AppBarTheme lightmode = AppBarTheme(
    elevation:0,
    backgroundColor:SAcolors.white,
    centerTitle: true,
  );

   static AppBarTheme darkmode = AppBarTheme(
    elevation:0,
    backgroundColor:SAcolors.black,
    centerTitle: true,
  );
}
