import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: ColorsManager.scaffoldBg,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.black,
          selectedItemColor: ColorsManager.yellow,
          unselectedItemColor: ColorsManager.gray,
          type: BottomNavigationBarType.shifting,
          elevation: 0));
}
