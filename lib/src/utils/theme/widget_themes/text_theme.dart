import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black87),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black87),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.black87),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black87),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black87),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black87),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black87),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black87),
  );

  static TextTheme darkTextTheme = TextTheme(
    // headline1
    displayLarge: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
    // headline 2
    displayMedium: GoogleFonts.montserrat(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.white),
    // headline 3
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white),
    // headline 4
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    // headline 5
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    // headline 6
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    // bodyText1
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    // bodyText2
    headlineSmall: GoogleFonts.poppins(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),
  );
}
