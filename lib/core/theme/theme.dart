import 'package:flutter/material.dart';
import 'package:zupay_store/core/theme/colors.dart';
import 'package:zupay_store/core/utils/extensions.dart';

/// Defines app theme including text themes.
class ApplicationTheme {
  static ThemeData getAppThemeData() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: iconColor),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryTextColor,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 48.0.sp,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          headline2: TextStyle(
            fontSize: 36.0.sp,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          headline3: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          headline4: TextStyle(
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
          headline5: TextStyle(
            fontSize: 8.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
          headline6: TextStyle(
            fontSize: 6.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
          subtitle2: TextStyle(
            fontSize: 4.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
          ),
          subtitle1: TextStyle(
            fontSize: 6.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
          ),
          bodyText1: TextStyle(
            fontSize: 8.0.sp,
            fontWeight: FontWeight.w500,
            color: bodyTextColor,
          ),
          bodyText2: TextStyle(
            fontSize: 8.0.sp,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
          ),
          button: TextStyle(
            fontSize: 8.0.sp,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
        ),
      );
}
