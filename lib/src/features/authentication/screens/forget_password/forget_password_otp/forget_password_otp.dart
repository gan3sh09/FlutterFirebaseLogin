// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/screens/signin_with_phone/signin_phone_screen.dart';
import 'package:pinput/pinput.dart';

class ForgetPasswordOtp extends StatefulWidget {
  const ForgetPasswordOtp({super.key});

  @override
  State<ForgetPasswordOtp> createState() => _ForgetPasswordOtpState();
}

class _ForgetPasswordOtpState extends State<ForgetPasswordOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var code = '';
    final themeData = Theme.of(context);
    final isDarkMode = themeData.brightness == Brightness.dark;

    final lightDefaultPinTheme = PinTheme(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: containerLight,
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: secondaryColor,
      ),
    );

    final darkDefaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: containerDark,
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: whiteColor,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30 * 4,
                ),
                const FormHeaderWidget(
                  image: logoImage,
                  title: otpVerifyTitle,
                  subTitle: otpVerifySubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: formHeight,
                ),
                Form(
                    child: Column(
                  children: [
                    Pinput(
                      defaultPinTheme: isDarkMode
                          ? darkDefaultPinTheme
                          : lightDefaultPinTheme,
                      /* validator: (value) {
                        return value == '123456' ? null : 'Pin is incorrect';
                      }, */
                      length: 6,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      autofocus: true,
                      showCursor: true,
                      onChanged: (value) {
                        code = value;
                      },
                      onCompleted: (pin) => print(pin),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Prevent dismissing the dialog by tapping outside
                            builder: (context) => const AlertDialog(
                              content: Row(
                                children: [
                                  CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Verifying'),
                                ],
                              ),
                            ),
                          );
                          try {
                            // Create a PhoneAuthCredential with the code
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                              verificationId: SigninPhoneScreen.verify,
                              smsCode: code,
                            );

                            // Sign the user in (or link) with the credential
                            await auth.signInWithCredential(credential);
                            Navigator.pushNamedAndRemoveUntil(
                                context, 'dashboard', (route) => false);
                          } catch (e) {
                            print('Wrong otp');
                          }
                        },
                        child: const Text(verifyText),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            editPhoneNumber,
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
