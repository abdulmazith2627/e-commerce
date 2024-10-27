import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/utils/colors.dart';

class SATextTheme{

 SATextTheme._();
 
 // light mode text theme

 static TextTheme lightmode=TextTheme(
   
      headlineLarge:GoogleFonts.roboto().copyWith(fontSize:40,fontWeight:FontWeight.bold,color:SAcolors.black,),
      headlineMedium:GoogleFonts.roboto().copyWith(fontSize:36,fontWeight:FontWeight.bold,color:SAcolors.black,),
      headlineSmall:GoogleFonts.roboto().copyWith(fontSize:32,fontWeight:FontWeight.bold,color:SAcolors.black,),
      
      titleLarge:GoogleFonts.roboto().copyWith(fontSize:28,fontWeight:FontWeight.bold,color:SAcolors.black,) ,
      titleMedium: GoogleFonts.roboto().copyWith(fontSize:24,fontWeight:FontWeight.bold,color:SAcolors.black,),
      titleSmall:GoogleFonts.roboto().copyWith(fontSize:20,fontWeight:FontWeight.bold,color:SAcolors.black,),

      bodyLarge:GoogleFonts.rubik().copyWith(fontSize:24,fontWeight:FontWeight.bold,color:SAcolors.black,),
      bodyMedium: GoogleFonts.rubik().copyWith(fontSize:20,fontWeight:FontWeight.bold,color:SAcolors.black,),
      bodySmall:GoogleFonts.rubik().copyWith(fontSize:14,fontWeight:FontWeight.bold,color:SAcolors.black,),
      
      labelLarge:GoogleFonts.roboto().copyWith(fontSize:28,fontWeight:FontWeight.bold,color:SAcolors.grey,),
      labelMedium:GoogleFonts.roboto().copyWith(fontSize:24,color:Colors.grey,),
      labelSmall:GoogleFonts.roboto().copyWith(fontSize:20,fontWeight:FontWeight.bold,color:SAcolors.grey,),
 );


 // dark mode text theme

 static TextTheme darkmode=TextTheme(
   
      headlineLarge:GoogleFonts.roboto().copyWith(fontSize:40,fontWeight:FontWeight.bold,color:SAcolors.white),
      headlineMedium:GoogleFonts.roboto().copyWith(fontSize:36,fontWeight:FontWeight.bold,color:SAcolors.white),
      headlineSmall:GoogleFonts.roboto().copyWith(fontSize:32,fontWeight:FontWeight.bold,color:SAcolors.white),
      
      titleLarge:GoogleFonts.roboto().copyWith(fontSize:28,fontWeight:FontWeight.bold,color:SAcolors.white) ,
      titleMedium: GoogleFonts.roboto().copyWith(fontSize:24,fontWeight:FontWeight.bold,color:SAcolors.white),
      titleSmall:GoogleFonts.roboto().copyWith(fontSize:20,fontWeight:FontWeight.bold,color:SAcolors.white),

      bodyLarge:GoogleFonts.rubik().copyWith(fontSize:24,fontWeight:FontWeight.bold,color:SAcolors.white),
      bodyMedium: GoogleFonts.rubik().copyWith(fontSize:20,fontWeight:FontWeight.bold,color:SAcolors.white),
      bodySmall:GoogleFonts.rubik().copyWith(fontSize:14,fontWeight:FontWeight.bold,color:SAcolors.white),
      
      labelLarge:GoogleFonts.roboto().copyWith(fontSize:28,fontWeight:FontWeight.bold,color:SAcolors.white),
      labelMedium:GoogleFonts.roboto().copyWith(fontSize:24,fontWeight:FontWeight.bold,color:const Color.fromARGB(125, 255, 255, 255),),
      labelSmall:GoogleFonts.roboto().copyWith(fontSize:20,fontWeight:FontWeight.bold,color:SAcolors.white),
 );

}