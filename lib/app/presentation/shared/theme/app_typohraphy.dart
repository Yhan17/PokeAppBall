import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle get textTitle => GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get textLarge => GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get textLargeDark => GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get textSmall => GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get pokemonId => GoogleFonts.poppins(
        color: const Color(0xFFC1C1C1),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      );
}
