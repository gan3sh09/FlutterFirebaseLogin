import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/screens/signin_with_phone/signin_phone_screen.dart';

class ForgetPasswordPhone extends StatefulWidget {
  const ForgetPasswordPhone({super.key});

  static String verify = '';

  @override
  State<ForgetPasswordPhone> createState() => _ForgetPasswordPhoneState();
}

class _ForgetPasswordPhoneState extends State<ForgetPasswordPhone> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController countrycode = TextEditingController();
  var phone = '';

  @override
  void initState() {
    countrycode.text = '+977';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            forgetPasswordScreenTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
                  title: forgetPasswordScreenTitle,
                  subTitle: forgetPhoneSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: formHeight,
                ),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        /* TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        label: Text(phoneText),
                        hintText: phoneText,
                      ),
                    ), */
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 42,
                              child: TextFormField(
                                controller: countrycode,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  phone = value;
                                },
                                keyboardType: TextInputType.phone,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                          .hasMatch(value)) {
                                    return 'Please enter your phone number';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintText: phoneText,
                                  prefixIcon: Icon(Icons.phone),
                                  label: Text(phoneText),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final isValid = _formkey.currentState!.validate();
                              if (!isValid) return;
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // Prevent dismissing the dialog by tapping outside
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                              );
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: countrycode.text + phone,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed:
                                    (FirebaseAuthException e) {},
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  SigninPhoneScreen.verify = verificationId;
                                  Navigator.pushNamed(context, 'otpscreen');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      backgroundColor: primaryColor,
                                      content: const Text(
                                        'Otp code sent sucessfully!',
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                  );
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            },
                            child: const Text(sendText),
                          ),
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
