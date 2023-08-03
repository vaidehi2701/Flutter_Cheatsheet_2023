import 'package:flutter/material.dart';

class PasswordStrengthProvider extends ChangeNotifier {
  String _password = '';
  double _strength = 0;
  String _displayText = 'Please enter a password';

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  void checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      _strength = 0;
      _displayText = 'Please enter you password ☹️';
    } else if (_password.length < 4) {
      _strength = 1 / 4;
      _displayText = 'Your password is too short ❌';
    } else if (_password.length < 6) {
      _strength = 2 / 4;
      _displayText = 'Your password is acceptable but not strong 😿';
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        _strength = 3 / 4;
        _displayText = 'Your password is strong  ✅';
      } else {
        _strength = 1;
        _displayText = 'Your password is great 💯';
      }
    }
    notifyListeners();
  }

  get strength => _strength;
  get displayText => _displayText;
}
