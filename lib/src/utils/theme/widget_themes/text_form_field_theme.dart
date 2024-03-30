import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  // light theme
  static InputDecorationTheme lightTextFormFieldTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    prefixIconColor: secondaryColor,
    contentPadding: const EdgeInsets.symmetric(vertical: 13),
    suffixIconColor: secondaryColor,
    floatingLabelStyle: const TextStyle(color: secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2.0, color: primaryColor),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  // dark theme
  static InputDecorationTheme darkTextFormFieldTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    prefixIconColor: whiteColor,
    suffixIconColor: whiteColor,
    contentPadding: const EdgeInsets.symmetric(vertical: 13),
    floatingLabelStyle: const TextStyle(color: whiteColor),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        color: whiteColor,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
