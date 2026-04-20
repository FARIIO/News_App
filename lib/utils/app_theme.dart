import 'package:elyoum_elsa2e3/utils/app_colors.dart';
import 'package:elyoum_elsa2e3/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.med20Black,
      bodyMedium: AppTextStyle.bold16Black,
      bodySmall: AppTextStyle.med14Black,
      titleSmall: AppTextStyle.med12Black,
      titleLarge: AppTextStyle.bold24Black,
      titleMedium: AppTextStyle.med24Black,
      labelLarge: AppTextStyle.med24White,
      labelMedium: AppTextStyle.med20White

    ),
    primaryColor: AppColors.black,
      cardColor: AppColors.white
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
      textTheme: TextTheme(
          bodyLarge: AppTextStyle.med20White,
          bodyMedium: AppTextStyle.bold16White,
          bodySmall: AppTextStyle.med14White,
          titleSmall: AppTextStyle.med12White,
          titleLarge: AppTextStyle.bold24White,
          titleMedium: AppTextStyle.med24White,
          labelLarge: AppTextStyle.med24Black,
          labelMedium: AppTextStyle.med20Black
      ),
    primaryColor: AppColors.white,
      cardColor: AppColors.black
  );
}