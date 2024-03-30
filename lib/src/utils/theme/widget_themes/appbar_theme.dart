import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class AAppBarTheme {
  AAppBarTheme._();

  // light theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: secondaryColor),
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
  );

  // dark theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: whiteColor),
    centerTitle: false,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
  );
}
