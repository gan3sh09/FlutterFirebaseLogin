import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    ),
  );
}
