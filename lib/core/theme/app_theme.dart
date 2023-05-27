import 'package:flutter/material.dart';
import 'sub_theme_data.dart';

const Color primaryColor = Color.fromRGBO(187, 104, 104, 1.0);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

const Color mainTextColor = Color.fromARGB(255, 40, 40, 40);


class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      iconTheme: getIconTheme(),
      cardColor: cardColor,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColor,
        displayColor: mainTextColor,
      ),
    );
  }
}