import 'package:flutter/material.dart';
import 'package:provider_test/data.dart';
import 'package:provider_test/level1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('$MyApp was rebuilt');

    return ChangeNotifierProvider<Data>(
      create: (BuildContext context) => Data(),
      child: const MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: MyAppBar(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('$MyAppBar was rebuilt');
    //TODO: get [doubleValue] from state management solution (sms).
    double doubleValue = Provider.of<Data>(context).doubleValue;

    String title = doubleValue.toStringAsFixed(2);
    return AppBar(
      title: Text(title),
    );
  }
}
