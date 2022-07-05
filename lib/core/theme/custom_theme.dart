import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.g.dart';

class CustomTheme extends ChangeNotifier {
  static CustomTheme? _instance;
  CustomTheme._();

  factory CustomTheme() {
    return _instance ??= CustomTheme._();
  }
  bool _isDark = true;
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  ThemeData _theme(ColorScheme colorScheme) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: colorScheme.onBackground,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 48,
            fontWeight: FontWeight.w100,
          ),
          headlineSmall: TextStyle(
            color: colorScheme.primary,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
          titleLarge: TextStyle(
            color: colorScheme.onBackground,
            fontWeight: FontWeight.w200,
          ),
        ),
        iconTheme: IconThemeData(
          color: colorScheme.onBackground,
        ),
      );

  ThemeData get lightTheme => _theme(lightColorScheme);

  ThemeData get darkTheme => _theme(darkColorScheme);
}
