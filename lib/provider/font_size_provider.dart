
import 'package:flutter/material.dart';

class FontType extends ChangeNotifier {
  FontTypeValue _value = FontTypeValue.medium;

  FontTypeValue get value => _value;

  set value(FontTypeValue newValue) {
    _value = newValue;
    notifyListeners();
  }
}

enum FontTypeValue { small, medium, large }