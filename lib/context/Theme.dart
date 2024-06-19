import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme));
}

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme));
}

// var themeVars = {
//   'themeMode': ThemeMode.dark,
//   'darkTheme': darkTheme(),
//   'theme': lightTheme()
// };
