import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get defaultTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF282828),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF282828),
          elevation: 0,
          centerTitle: true,
        ),
      );
}
