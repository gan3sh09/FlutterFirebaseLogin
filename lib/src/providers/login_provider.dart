import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isChecked = false;

  // get method
  bool get isChecked => _isChecked;

  // checkbox
  void setIsChecked({required bool value}) {
    _isChecked = value;
    notifyListeners();
  }
}