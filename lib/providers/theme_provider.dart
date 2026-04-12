import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  //todo: data
  ThemeMode appTheme = ThemeMode.dark;
  //todo: methods
  void changeTheme(ThemeMode newTheme){
    if(appTheme == newTheme){
      return ;
    }
    notifyListeners();
  }
  bool get isDark => appTheme == ThemeMode.dark;
}