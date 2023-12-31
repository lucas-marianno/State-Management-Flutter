import 'package:flutter/material.dart';
import 'package:provider_test/level2.dart';
import 'package:provider_test/mytextfield.dart';

class Level1 extends StatelessWidget {
  const Level1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('$Level1 was rebuilt');
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Level2a(),
        Expanded(child: Center(child: MyTextField(2))),
        Level2b(),
      ],
    );
  }
}
