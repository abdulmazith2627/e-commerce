import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/utils/colors.dart';

class SAelevatedButtonTheme{
  SAelevatedButtonTheme._();

  static final lightmode=ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation:0,
      backgroundColor:SAcolors.primaryColor,
      foregroundColor:SAcolors.white,
      disabledBackgroundColor:SAcolors.grey,
      disabledForegroundColor:SAcolors.grey,
      fixedSize:const Size(300,50),
      textStyle:GoogleFonts.inter(fontSize:16,fontWeight:FontWeight.bold,color:Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(10),
      ),
      padding:const EdgeInsets.all(5),
    )
  );


    static final darkmode=ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation:0,
      backgroundColor:SAcolors.primaryColor,
      foregroundColor:SAcolors.white,
      disabledBackgroundColor:SAcolors.grey,
      disabledForegroundColor:SAcolors.grey,
      fixedSize:const Size(300,50),
      textStyle:GoogleFonts.inter(fontSize:16,fontWeight:FontWeight.bold,color:Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(10),
      )
    )
  );

}