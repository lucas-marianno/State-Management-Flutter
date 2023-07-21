import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_test/singletonclass.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
    this.ratio, {
    super.key,
  });

  final double ratio;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  MySingleton singleton = MySingleton();

  @override
  Widget build(BuildContext context) {
    double doubleValue = singleton.getDouble() * widget.ratio;

    if (!focus.hasFocus) controller.clear();
    singleton.addListener(() => setState(() {}));

    return TextField(
      focusNode: focus,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: doubleValue.toStringAsFixed(2)),
      textAlign: TextAlign.center,
      onChanged: (value) {
        try {
          singleton.setDouble(double.parse(value) / widget.ratio);
        } catch (e) {
          //just ignore
        }
      },
      onTap: () {
        if (!focus.hasFocus) {
          controller.text = doubleValue.toStringAsFixed(2);
          controller.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.text.length,
          );
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d|\.')),
      ],
    );
  }
}
