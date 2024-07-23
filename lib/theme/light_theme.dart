import 'package:flutter/material.dart';

// Define your custom font family names
const String _kFontFamily = 'Lato';

const Color ATColor = Color(0xFFCA996E);

// Define your custom light mode theme
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade600,
    onPrimary: Colors.grey.shade200,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontFamily: _kFontFamily),
    bodyMedium: TextStyle(fontFamily: _kFontFamily),
    displayLarge: TextStyle(fontFamily: _kFontFamily),
    displayMedium: TextStyle(fontFamily: _kFontFamily),
    // Define other text styles as needed
  ),
);