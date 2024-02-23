import 'package:exam_productive_5/assets/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static darkTheme() => ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: appBarTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: appBarTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: appBarTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: forgotPasswordTextColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: forgotPasswordTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: gmailTextColor,
      ),
    ),

    fontFamily: 'Barlow',
    scaffoldBackgroundColor: scaffoldColor,
    appBarTheme: const AppBarTheme(backgroundColor: scaffoldColor),
  );
}
