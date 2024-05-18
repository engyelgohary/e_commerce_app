import 'package:e_commerce_app/utils/theme/my_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
static ThemeData mainTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor
    ),
    titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor
    ),
    titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.darkBlueColor
    )
  )
);
}