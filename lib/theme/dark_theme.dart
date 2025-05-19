import 'package:flutter/material.dart';

import 'colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.grey900,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.grey100,
    centerTitle: true,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.grey900,
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.grey100,
    secondary: AppColors.grey500,
    primaryContainer: AppColors.grey800,
    surface: AppColors.grey600,
    outline: AppColors.grey900,
  ),
);
