import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/sizes.dart';

class EElevatedButtonTheme {
  EElevatedButtonTheme._();

  // light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        side: const BorderSide(color: primaryColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)),
  );

  // dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        side: const BorderSide(color: primaryColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)),
  );
}
