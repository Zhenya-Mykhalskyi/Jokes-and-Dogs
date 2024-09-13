import 'package:flutter/material.dart';
import 'package:jokes_generator/constants/app_colors.dart';

class AppFonts {
  AppFonts._();

  static const TextStyle mainText = TextStyle(
    fontFamily: 'NerkoOne',
    fontSize: 22.0,
    color: AppColors.maintext,
  );

  static const TextStyle logoText = TextStyle(
    fontFamily: 'NerkoOne',
    fontSize: 20.0,
    color: AppColors.maintext,
  );

  static const TextStyle actionButtonText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: AppColors.white,
  );
}
