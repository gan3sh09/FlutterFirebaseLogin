import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forgetPasswordTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mail_outline_rounded,
                    title: loginEmail,
                    subtitle: resetViaEmail,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevents dismissing dialog by tapping outside
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          );
                        },
                      );

                      // Simulate a delay of 3 seconds before navigating
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.pop(context); // Close the bottomsheet
                        Navigator.pushNamed(context,
                            'forgetemail'); // Navigate to signup screen
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ForgetPasswordBtnWidget(
                    btnIcon: Icons.mobile_friendly_rounded,
                    title: phoneText,
                    subtitle: resetViaPhone,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevents dismissing dialog by tapping outside
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          );
                        },
                      );

                      // Simulate a delay of 3 seconds before navigating
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.pop(context); // Close the bottomsheet
                        Navigator.pushNamed(context,
                            'forgetphone'); // Navigate to signup screen
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
