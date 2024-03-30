// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/screens/dashboard_screen/dashboard_screen.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) {
          checkEmailVerified();
        },
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: primaryColor,
          content: const Text(
            'Verification email sent sucessfully!',
            style: TextStyle(color: whiteColor),
          ),
        ),
      );
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return isEmailVerified
        ? const DashboardScreen()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () {
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
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(
                            context, 'login'); // Navigate to login screen
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: defaultSize * 3,
                      ),
                      const FormHeaderWidget(
                        image: logoImage,
                        title: emailVerifyTitle,
                        subTitle: emailVerifySubTitle,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textAlign: TextAlign.center,
                        heightBetween: 10,
                      ),
                      const SizedBox(
                        height: formHeight,
                      ),
                      Text(
                        user.email!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: formHeight,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
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
                                  canResendEmail ? sendVerificationEmail : null;
                                });
                              },
                              child: const Text(resendEmail),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text(
                              cancelText,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
