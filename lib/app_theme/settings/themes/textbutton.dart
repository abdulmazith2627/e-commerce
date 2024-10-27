import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';

class SAtextbutton {
  SAtextbutton._();

  static final lightmode = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: SAcolors.primaryColor,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final darkmode = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor:SAcolors.primaryColor,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
