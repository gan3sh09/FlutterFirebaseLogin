import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:loginapp/src/features/authentication/screens/signup_screen/layout/email_verify_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else if (snapshot.hasData) {
            return const EmailVerifyScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
