import 'package:flutter/material.dart';
import 'package:provider_test/level1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('$MyApp was rebuilt');

    //TODO: get [doubleValue] from state management solution (sms).
    double doubleValue = 0;
    String title = doubleValue.toStringAsFixed(2);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Level1(),
      ),
    );
  }
}
