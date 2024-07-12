import 'package:flutter/material.dart';
import 'package:recipes_app/theme/app_color.dart';
 

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorDark: AppColors.primaryVariantColor,
   
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.orange),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    // Define other text styles here
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColor,
    size: 24.0,
  ),
  // Define other theme properties here
);

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primaryColorDark: AppColors.primaryVariantColor,
  
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.orange),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
    // Define other text styles here
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primaryColor,
    size: 24.0,
  ),
  // Define other theme properties here
);

// Default theme mode
ThemeMode currentThemeMode = ThemeMode.light;
