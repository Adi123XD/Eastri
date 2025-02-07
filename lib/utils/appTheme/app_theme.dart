import 'package:eastri_customer_app/res/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.secondaryColor),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 14,
          color: Colors.grey,
        ),
      ));
}
