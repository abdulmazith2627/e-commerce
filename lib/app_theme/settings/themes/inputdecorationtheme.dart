import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/utils/colors.dart';


class SAinputDecorationTheme{
  SAinputDecorationTheme._();

  static InputDecorationTheme lightmode = InputDecorationTheme(
    errorMaxLines:2,
    prefixIconColor:SAcolors.grey,
    suffixIconColor:SAcolors.grey,
    hintStyle:GoogleFonts.inter().copyWith(fontSize:20,color:SAcolors.grey,fontWeight:FontWeight.normal),
    border: OutlineInputBorder(
      borderSide: BorderSide(color:SAcolors.black,width:1.25),
      borderRadius:const BorderRadius.all(Radius.circular(10)),
    ),
    contentPadding:const EdgeInsets.all(10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color:SAcolors.black,width:1),
      borderRadius:const BorderRadius.all(Radius.circular(10)),
    ), 
    focusedBorder:  OutlineInputBorder(
      borderSide: BorderSide(color:SAcolors.black,width:2),
      borderRadius:const BorderRadius.all(Radius.circular(10)),
    )
    
   
  );

    static InputDecorationTheme darkmode = InputDecorationTheme(
    errorMaxLines:2,
    prefixIconColor:SAcolors.grey,
    suffixIconColor:SAcolors.grey,
    hintStyle:GoogleFonts.inter(fontSize:20,color:SAcolors.grey),
    border: OutlineInputBorder(
        borderSide: BorderSide(color:SAcolors.white,width:2),
      borderRadius:const BorderRadius.all(Radius.circular(10)),
    ),
    contentPadding:const EdgeInsets.all(5),
    focusedBorder:  OutlineInputBorder(
    borderSide: BorderSide(color:SAcolors.white,width:2),
    borderRadius:const BorderRadius.all(Radius.circular(10)),
    )
  );
}
