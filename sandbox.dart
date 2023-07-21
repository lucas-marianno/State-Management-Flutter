// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MySingleton extends ChangeNotifier {
  MySingleton._internal();
  static final MySingleton _instance = MySingleton._internal();
  factory MySingleton() => _instance;

  int _int = 0;

  void incrementInt() {
    _int++;
    notifyListeners();
  }

  int myIntValue() => _int;
}

void main() {
  MySingleton firstSingleton = MySingleton();
  MySingleton secondSingleton = MySingleton();
  print('first:');
  print(firstSingleton.myIntValue());
  print('second:');
  print(secondSingleton.myIntValue());

  firstSingleton.incrementInt();

  print('first:');
  print(firstSingleton.myIntValue());
  print('second:');
  print(secondSingleton.myIntValue());

  secondSingleton.incrementInt();

  print('first:');
  print(firstSingleton.myIntValue());
  print('second:');
  print(secondSingleton.myIntValue());
}
