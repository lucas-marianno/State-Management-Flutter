import 'package:flutter/material.dart';
import 'package:provider_test/level3.dart';

class Level2a extends StatelessWidget {
  const Level2a({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('$Level2a was rebuilt');
    return Expanded(
      child: Container(
        color: Colors.green,
        child: const Padding(
          padding: EdgeInsets.all(30),
          child: Level3a(),
        ),
      ),
    );
  }
}

class Level2b extends StatelessWidget {
  const Level2b({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('$Level2b was rebuilt');
    return Expanded(
      child: Container(
        color: Colors.lightBlueAccent,
        child: const Padding(
          padding: EdgeInsets.all(30),
          child: Level3b(),
        ),
      ),
    );
  }
}
