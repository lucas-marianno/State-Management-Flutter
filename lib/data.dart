import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  double doubleValue = 0;

  void setDoubleValue(double n) {
    print('hi');
    doubleValue = n;
    notifyListeners();
  }
}
