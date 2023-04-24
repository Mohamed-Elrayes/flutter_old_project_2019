import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ColorScheme lightColorScheme =
      const ColorScheme.light(primary: Colors.black, secondary: Colors.black , onSecondary: Colors.white);
  static ColorScheme darkColorScheme =
      const ColorScheme.dark(primary: Colors.white, secondary: Colors.white);

  static ThemeData get darkThemeData => _themeData(
      colorScheme: darkColorScheme,
      textTheme: GoogleFonts.spaceMonoTextTheme(ThemeData.dark().textTheme)).copyWith(
        
      );

  static ThemeData get lightThemeData => _themeData(
      colorScheme: lightColorScheme,
      textTheme: GoogleFonts.spaceMonoTextTheme());

  static ThemeData _themeData(
          {required ColorScheme colorScheme, TextTheme? textTheme}) =>
      ThemeData.from(colorScheme: colorScheme, textTheme: textTheme);
}
