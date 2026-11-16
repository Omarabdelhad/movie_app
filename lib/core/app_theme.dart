import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.yellowColor
      ),
      
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,

      ),
      displaySmall: TextStyle(
        color: AppColors.yellowColor,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      labelSmall:  TextStyle(
        color: AppColors.greyColor,
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
      ),
      bodyLarge: TextStyle(
        color: AppColors.yellowColor,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
      ),
    ),
  );
    }