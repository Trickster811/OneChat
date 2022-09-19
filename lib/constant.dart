import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static int isDark = 0;

  static Future init() async {
    isDark = UserSimplePreferences.getTheme()!;
  }

  ThemeMode themeMode = isDark == 0 ? ThemeMode.light : ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    UserSimplePreferences.setTheme(isOn ? 1 : 0);
    notifyListeners();
    // final theme = await SharedPreferences.getInstance();
    // theme.setBool('isDark', isOn);
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Color.fromRGBO(5, 35, 61, 1),
      fontFamily: 'Comfortaa_bold',
      colorScheme: ColorScheme.dark(),
      bottomAppBarColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white));
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 241, 241, 241),
    fontFamily: 'Comfortaa_bold',
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    bottomAppBarColor: Colors.white,
    iconTheme: IconThemeData(
      color: Color.fromRGBO(5, 35, 61, 1),
    ),
  );
}

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const themeMode = 'isDark';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setTheme(int isDark) async {
    await _preferences.setInt(themeMode, isDark);
  }

  static int? getTheme() => _preferences.getInt(themeMode);
}
