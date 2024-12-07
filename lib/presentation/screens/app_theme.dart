import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.black,
          selectedItemColor: ColorsManager.yellow,
          unselectedItemColor: ColorsManager.gray,
          type: BottomNavigationBarType.shifting,
          elevation: 0));
}
