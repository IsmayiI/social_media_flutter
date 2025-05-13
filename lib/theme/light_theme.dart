import 'package:flutter/material.dart';

import 'colors.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.grey300,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.grey900,
      centerTitle: true,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.grey300,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.grey900,
      secondary: AppColors.grey400,
      primaryContainer: Colors.white,
      surface: AppColors.grey600,
      outline: AppColors.grey300,
    ));
