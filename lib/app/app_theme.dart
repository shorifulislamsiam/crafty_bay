import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
        bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),

        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.2, color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.2, color: Colors.red),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 10),
          textStyle: TextStyle(
            fontSize: 18,
            letterSpacing: .5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
