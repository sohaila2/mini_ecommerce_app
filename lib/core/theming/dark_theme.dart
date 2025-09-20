import 'package:flutter/material.dart';

/// Dark theme
ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
