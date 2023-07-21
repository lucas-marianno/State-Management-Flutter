import 'package:flutter/material.dart';
import 'package:provider_test/level1.dart';
import 'package:provider_test/singletonclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MySingleton singleton = MySingleton();

  @override
  void initState() {
    super.initState();
    singleton.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    print('$MyApp');
    // String title = singleton.getString();
    String title = singleton.getDouble().toStringAsFixed(2);
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
