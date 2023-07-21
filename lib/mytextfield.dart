import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    print('$MyTextField was rebuilt');

    //TODO: get [doubleValue] from state management solution (sms).
    double doubleValue = 0;
    doubleValue *= widget.ratio;

    if (!focus.hasFocus) controller.clear();
    // TODO: rebuild widget everytime doubleValue has a new value from sms.

    return TextField(
      focusNode: focus,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: doubleValue.toStringAsFixed(2)),
      textAlign: TextAlign.center,
      onChanged: (value) {
        try {
          final newDouble = double.parse(value) / widget.ratio;
          // TODO: notify sms that it has a new value.
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
