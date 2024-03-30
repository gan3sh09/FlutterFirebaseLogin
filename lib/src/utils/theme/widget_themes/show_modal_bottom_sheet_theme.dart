import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class ShowModalBottomSheetTheme {
  ShowModalBottomSheetTheme._();

  // light theme
  static const lightModalBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: whiteColor,
  );

  // dark theme
  static const darkModalBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: secondaryColor
  );
}
