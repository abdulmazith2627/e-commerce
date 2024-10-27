import 'package:flutter/material.dart';
import 'package:my_app/app_theme/settings/themes/appbartheme.dart';
import 'package:my_app/app_theme/settings/themes/bottomnavigationbartheme.dart';
import 'package:my_app/app_theme/settings/themes/drawerthemes.dart';
import 'package:my_app/app_theme/settings/themes/elevatedbuttontheme.dart';
import 'package:my_app/app_theme/settings/themes/floatingactionbuttontheme.dart';
import 'package:my_app/app_theme/settings/themes/inputdecorationtheme.dart';
import 'package:my_app/app_theme/settings/themes/textbutton.dart';
import 'package:my_app/app_theme/settings/themes/textthemes.dart';
import 'package:my_app/utils/colors.dart';

class SAThemes{
 
 SAThemes._();


   // light mode 
 static ThemeData lightmode=ThemeData(
      useMaterial3:true,
      brightness:Brightness.light,
      scaffoldBackgroundColor:Colors.white,
      primaryColor:SAcolors.primaryColor,
      textTheme: SATextTheme.lightmode,
      elevatedButtonTheme:SAelevatedButtonTheme.lightmode,
      inputDecorationTheme:SAinputDecorationTheme.lightmode,
      floatingActionButtonTheme: FloatingActionbuttonTheme.lightmode,
      textButtonTheme:SAtextbutton.lightmode,
      bottomNavigationBarTheme:BottomnavigationbarTheme.lightmode,
      appBarTheme:Appbartheme.lightmode,
      drawerTheme: Drawerthemes.lightmode
     
      
 );

     
        // dark mode 
      
  static ThemeData darkmode=ThemeData(
      useMaterial3:true,
      brightness:Brightness.dark,
      scaffoldBackgroundColor:Colors.black,
      primaryColor:SAcolors.primaryColor,
      textTheme: SATextTheme.darkmode,
      elevatedButtonTheme:SAelevatedButtonTheme.darkmode,
      inputDecorationTheme:SAinputDecorationTheme.darkmode,
      floatingActionButtonTheme: FloatingActionbuttonTheme.darkmode,
      textButtonTheme:SAtextbutton.darkmode,
      bottomNavigationBarTheme:BottomnavigationbarTheme.darkmode,
      appBarTheme:Appbartheme.darkmode,
       drawerTheme: Drawerthemes.darkmode

 );

}