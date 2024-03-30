// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// signup with email and password
  Future<User?> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.red,
          content: const Text(
            'Email already exists. Please try different one!',
            style: TextStyle(color: whiteColor),
          ),
        ),
      );
    }
    return null;
  }

// signin with email and password
  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.red,
          content: const Text(
            'Login failed. Please check your email & password and try again!',
            style: TextStyle(color: whiteColor),
          ),
        ),
      );
    }
    return null;
  }
}
