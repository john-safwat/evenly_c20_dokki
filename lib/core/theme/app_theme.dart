import 'package:evently_c20_dokki/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppColors appColors;
  AppTheme(this.appColors);

  ThemeData get theme => ThemeData(
    colorScheme: ColorScheme(
      brightness: appColors.brightness,
      primary: appColors.mainColor,
      onPrimary: appColors.inputColor,
      secondary: appColors.mainTextColor,
      onSecondary: appColors.inputColor,
      error: appColors.errorColor,
      onError: appColors.inputColor,
      surface: appColors.backgroundColor,
      onSurface: appColors.mainColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: appColors.backgroundColor,
      foregroundColor: appColors.mainTextColor,
      centerTitle: true,
      shadowColor: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: appColors.backgroundColor,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(16),
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: .bold
        )
      )
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: appColors.mainTextColor),
      displayMedium: TextStyle(color: appColors.mainTextColor),
      displaySmall: TextStyle(color: appColors.mainTextColor),
      headlineLarge: TextStyle(color: appColors.mainTextColor),
      headlineMedium: TextStyle(color: appColors.mainTextColor),
      headlineSmall: TextStyle(color: appColors.mainTextColor),
      titleLarge: TextStyle(color: appColors.mainTextColor),
      titleMedium: TextStyle(color: appColors.mainTextColor),
      titleSmall: TextStyle(color: appColors.mainTextColor),
      bodyLarge: TextStyle(color: appColors.mainTextColor),
      bodyMedium: TextStyle(color: appColors.mainTextColor),
      bodySmall: TextStyle(color: appColors.mainTextColor),
      labelLarge: TextStyle(color: appColors.mainTextColor),
      labelMedium: TextStyle(color: appColors.mainTextColor),
      labelSmall: TextStyle(color: appColors.mainTextColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appColors.mainColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    )
  );
}
