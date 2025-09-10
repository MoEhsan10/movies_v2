import 'package:flutter/material.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class AppTheme {

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.darkGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: ColorsManager.yellow,
      unselectedItemColor: ColorsManager.white,
    ),
    iconTheme: const IconThemeData(
      color: ColorsManager.white
    ),
  );


}