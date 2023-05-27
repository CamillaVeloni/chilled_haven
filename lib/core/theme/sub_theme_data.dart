import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

mixin SubThemeData {
  TextTheme getTextThemes() {
    return GoogleFonts.poppinsTextTheme(const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
      ),
    ));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(
      color: mainTextColor, size: 22,
    );
  }
}