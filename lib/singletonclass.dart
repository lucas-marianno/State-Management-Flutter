import 'package:flutter/material.dart';

/// [MySingleton] is class that ensures that only one instance
/// of this class is ever created and provides a global point
/// of access to its values.
///
/// [MySingleton] extends [ChangeNotifier]. Add a listener to
/// one of its instances to receive realtime updates.

class MySingleton extends ChangeNotifier {
  static final MySingleton _instance = MySingleton._internal();
  MySingleton._internal();
  factory MySingleton() => _instance;

  String getString() => _string;

  void setString(String s) {
    _string = s;
    notifyListeners();
  }

  double getDouble() => _double;
  void setDouble(double n) {
    _double = n;
    notifyListeners();
  }

  String _string = '';
  double _double = 0;
}
