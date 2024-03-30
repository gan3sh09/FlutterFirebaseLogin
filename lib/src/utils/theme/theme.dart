import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/utils/theme/widget_themes/appbar_theme.dart';
import 'package:loginapp/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:loginapp/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:loginapp/src/utils/theme/widget_themes/show_modal_bottom_sheet_theme.dart';
import 'package:loginapp/src/utils/theme/widget_themes/text_form_field_theme.dart';
import 'package:loginapp/src/utils/theme/widget_themes/text_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme (bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}

class AAppTheme {
  AAppTheme._();
// light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: scafLightBackground,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: OOutlineButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightTextFormFieldTheme,
    appBarTheme: AAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ShowModalBottomSheetTheme.lightModalBottomSheetTheme,
    
    
  );

// dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: scafDarkBackground,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: OOutlineButtonTheme.darkOutlineButtonTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkTextFormFieldTheme,
    appBarTheme: AAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: ShowModalBottomSheetTheme.darkModalBottomSheetTheme,

  );
}
