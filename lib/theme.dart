import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData.dark();

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.green[700],
  );

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
  );

  ThemeProvider({bool? isDarkMode}) {
  _selectedTheme = (isDarkMode ?? false) ? dark : light;
}


  ThemeData get getTheme => _selectedTheme;

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool("isDarkTheme", false);
    }else {
      _selectedTheme = dark;
      prefs.setBool("isDarkTheme", true);
    }
    notifyListeners();
  }
}
