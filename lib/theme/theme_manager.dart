import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEFF1F3),

    // Color Scheme
    colorScheme: const ColorScheme.light(
      surface: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: GoogleFonts.pridi(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF141517),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1A1B1E),
      centerTitle: false,
      titleTextStyle: GoogleFonts.ultra(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          letterSpacing: 1.5,
        ),
      ),
    ),

    // Color Scheme
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xFFF8D65B),
      surface: Color(0xFF383A3F),
    ),
  );
}
