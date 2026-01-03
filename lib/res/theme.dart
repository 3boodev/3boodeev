import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Craftivo / Modern Aesthetic Colors
  static const Color primaryColor = Color(0xFF8A1556); // Amber/Goldish
  static const Color secondaryColor = Color(0xFF242430);
  
  // Dark Theme Colors
  static const Color darkBgColor = Color(0xFF191923);
  static const Color darkSurfaceColor = Color(0xFF242430);
  static const Color darkBodyTextColor = Color(0xFF8B8B8D);

  // Light Theme Colors
  static const Color lightBgColor = Color(0xFFFFFFFF);
  static const Color lightSurfaceColor = Color(0xFFF8F9FA); // Gray 50
  static const Color lightBodyTextColor = Color(0xFF666666);
  static const Color lightHeadingColor = Color(0xFF333333);

  static const double defaultPadding = 20.0;
  static const double maxWidth = 1200.0; // Max width for web content

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBgColor,
      canvasColor: darkBgColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: darkSurfaceColor,
        background: darkBgColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)
          .apply(bodyColor: Colors.white)
          .copyWith(
            bodyLarge: const TextStyle(color: darkBodyTextColor),
            bodyMedium: const TextStyle(color: darkBodyTextColor),
          ),
      iconTheme: const IconThemeData(color: darkBodyTextColor),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBgColor,
      canvasColor: lightBgColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: lightSurfaceColor,
        surface: lightSurfaceColor,
        background: lightBgColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme)
          .apply(bodyColor: lightHeadingColor)
          .copyWith(
            displayLarge: GoogleFonts.poppins(color: lightHeadingColor, fontWeight: FontWeight.bold),
            displayMedium: GoogleFonts.poppins(color: lightHeadingColor, fontWeight: FontWeight.bold),
            titleLarge: GoogleFonts.poppins(color: lightHeadingColor, fontWeight: FontWeight.bold),
            bodyLarge: const TextStyle(color: lightBodyTextColor),
            bodyMedium: const TextStyle(color: lightBodyTextColor),
          ),
      iconTheme: const IconThemeData(color: lightBodyTextColor),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: lightHeadingColor),
        titleTextStyle: TextStyle(color: lightHeadingColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
