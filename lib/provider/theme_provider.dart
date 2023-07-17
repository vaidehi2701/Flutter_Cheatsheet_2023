import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeDataCollection.baseTheme;

  ThemeData get themeData => _themeData;

  void changeTheme(Color baseColor) {
    _themeData = ThemeDataCollection.getThemeData(baseColor);
    notifyListeners();
  }
}

class ThemeDataCollection {
  static final baseTheme = _getThemeData(Colors.blue);
  static final orangeTheme = _getThemeData(Colors.orange);
  static final greenTheme = _getThemeData(Colors.green);
  static final redTheme = _getThemeData(Colors.red);
  static final brownTheme = _getThemeData(Colors.brown);
  static final purpleTheme = _getThemeData(Colors.purple);

  static ThemeData _getThemeData(MaterialColor color) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: color,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
  }

  static ThemeData getThemeData(Color baseColor) {
    switch (baseColor) {
      case Colors.orange:
        return orangeTheme;
      case Colors.green:
        return greenTheme;
      case Colors.red:
        return redTheme;
      case Colors.brown:
        return brownTheme;
      case Colors.purple:
        return purpleTheme;
      default:
        return baseTheme;
    }
  }
}
