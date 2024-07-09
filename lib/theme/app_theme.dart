import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColor.colorScheme,
      primaryColor: AppColor.colorScheme.primary,
      scaffoldBackgroundColor: AppColor.colorScheme.background,
      textTheme: AppColor.poppinsTextTheme().apply(
        bodyColor: AppColor.textColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.colorScheme.background,
        foregroundColor: AppColor.textColor,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColor.colorScheme.background,
      ),
      iconTheme: const IconThemeData(
        color: AppColor.textColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: AppColor.textColor,
        suffixIconColor: AppColor.textColor,
        labelStyle: TextStyle(
          color: AppColor.textColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.colorScheme.primary,
            foregroundColor: AppColor.colorScheme.background),
      ),
    );
  }
}