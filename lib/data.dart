import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  double doubleValue = 1;

  void setDoubleValue(double n) {
    doubleValue = n;
    notifyListeners();
  }
}
