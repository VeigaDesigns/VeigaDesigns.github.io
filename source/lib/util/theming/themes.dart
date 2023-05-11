import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Portfolio Themes
class PortfolioThemes {
  ///Light Theme
  static ThemeData light() {
    return ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF2F2F2),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFFF2F2F2),
        secondary: const Color(0xFF7744DD),
      ),
    );
  }

  ///Dark Theme
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF161B22),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color(0xFFF2F2F2),
        secondary: const Color(0xFF7744DD),
      ),
    );
  }
}
