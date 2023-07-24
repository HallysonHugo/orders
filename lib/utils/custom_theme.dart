import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemeData{
  static ThemeData themeData(BuildContext context){
    return ThemeData(
      textTheme: GoogleFonts.ralewayTextTheme(
        Theme.of(context).textTheme,
      ),
    primaryColor: Colors.black87,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800]
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.greenAccent[400]
      )
    ),
   );
  }
}