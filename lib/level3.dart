import 'package:flutter/material.dart';
import 'mytextfield.dart';

class Level3a extends StatelessWidget {
  const Level3a({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('$Level3a was rebuilt');
    return Container(
      color: Colors.white,
      child: const Center(
        child: MyTextField(1),
      ),
    );
  }
}

class Level3b extends StatelessWidget {
  const Level3b({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('$Level3b was rebuilt');
    return Container(
      color: Colors.white,
      child: const Center(
        child: MyTextField(4.82),
      ),
    );
  }
}
