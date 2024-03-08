import "package:branchbuddy/utils/index.dart" show hexToColor;
import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: hexToColor("#91C788"),
    secondary: hexToColor("#DDFFBC"),
    tertiary: hexToColor("#EFFFE0"),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 20),
    bodySmall: TextStyle(fontSize: 16),
    labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  )
);