// ignore_for_file: unused_element, use_build_context_synchronously, unnecessary_nullable_for_final_variable_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

bool _isLoading = false;

Future<UserCredential?> googleLogin(BuildContext context) async {
  try {
    _isLoading = true;
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

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // User canceled the Google Sign-In
      _isLoading = false;
      Navigator.pop(context); // Close the dialog
      return null;
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    _isLoading = false;
    Navigator.pop(context); // Close the dialog

    return userCredential;
  } catch (e) {
    _isLoading = false;
    Navigator.pop(context); // Close the dialog
    // Handle error
    return null;
  } finally {
    _isLoading = false;
  }
}
