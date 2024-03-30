import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/sizes.dart';

class OOutlineButtonTheme {
  OOutlineButtonTheme._();

  // light theme
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: secondaryColor,
        side: const BorderSide(color: secondaryColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)),
  );

  // dark theme
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: whiteColor,
        side: const BorderSide(color: whiteColor),
        padding: const EdgeInsets.symmetric(vertical: buttonHeight)),
  );
}
