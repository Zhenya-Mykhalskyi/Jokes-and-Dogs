import 'package:flutter/material.dart';
import 'package:jokes_generator/constants/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: AppColors.white,
    colorScheme: const ColorScheme.dark(),
    canvasColor: AppColors.backgraund,
    scaffoldBackgroundColor: AppColors.backgraund,
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
    ),
  );
}
