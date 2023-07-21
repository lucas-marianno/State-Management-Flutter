import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/data.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
    this.ratio, {
    super.key,
  });

  final double ratio;

  final TextEditingController controller = TextEditingController();

  final FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    print('$MyTextField was rebuilt');

    //TODO: get [doubleValue] from state management solution (sms).
    double doubleValue = Provider.of<Data>(context).doubleValue;
    doubleValue *= ratio;

    if (!focus.hasFocus) controller.clear();
    // TODO: rebuild widget everytime doubleValue has a new value from sms.

    return TextField(
      focusNode: focus,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: doubleValue.toStringAsFixed(2)),
      textAlign: TextAlign.center,
      onChanged: (value) {
        final double newDouble = (double.tryParse(value) ?? 0) / ratio;
        Provider.of<Data>(context, listen: false).setDoubleValue(newDouble);
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
