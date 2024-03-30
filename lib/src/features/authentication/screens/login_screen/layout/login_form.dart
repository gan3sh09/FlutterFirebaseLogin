// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';
import 'package:loginapp/src/features/authentication/controllers/email_password_signupin/signupin_controller.dart';
import 'package:loginapp/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool? isChecked = false;

  bool _isObscure = true;

  final _formkey = GlobalKey<FormState>();

  // login with email and password
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: formHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please enter a valid email");
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _emailController.text = value!;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  label: Text(loginEmail),
                  hintText: loginEmail,
                ),
              ),
              const SizedBox(
                height: formHeight - 10,
              ),
              TextFormField(
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (!regex.hasMatch(value)) {
                    return ("please enter valid password min. 6 character");
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility),
                  ),
                  label: const Text(loginPassword),
                  hintText: loginPassword,
                ),
              ),
              const SizedBox(
                height: formHeight - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: isChecked,
                          activeColor: primaryColor,
                          checkColor: whiteColor,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(rememberMe),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(
                      loginForgetPassword,
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _signIn();
                  },
                  child: const Text(loginText),
                ),
              ),
            ],
          ),
        ));
  }

  void _signIn() async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) return;

    _showLoadingDialog(context);
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _auth.signInWithEmailAndPassword(context, email, password);

    if (user != null) {
      print('Login sucessfully');

      Navigator.pushNamed(context, 'dashboard');
    } else {
      print('some error occured.');
    }
  }

  /* void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } */

  void _showLoadingDialog(BuildContext context) {
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
}
