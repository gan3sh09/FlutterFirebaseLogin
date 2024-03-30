import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 35,
      width: 70,
      child: FittedBox(
        child: Switch.adaptive(
          value: themeProvider.isDarkMode,
          activeColor: contentContainerDark,
          inactiveThumbColor: Colors.green.shade900,
          onChanged: (value) {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value);
          },
        ),
      ),
    );
  }
}
