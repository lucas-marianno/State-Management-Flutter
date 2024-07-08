import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_test/bloc/value_bloc.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
    this.ratio, {
    super.key,
  });

  final double ratio;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FocusNode focus = FocusNode();
    print('$MyTextField was rebuilt');

    return BlocBuilder<ValueBloc, ValueState>(
      builder: (context, state) {
        if (state is ValueInitialState) {
          return const CircularProgressIndicator();
        }
        if (state is ValueLoadedState) {
          // Clears text if has new value and it's not on focus
          if (!focus.hasFocus) controller.clear();

          // Get [doubleValue] from state management solution (sms).
          double doubleValue = state.value;
          doubleValue *= ratio;

          return Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onTapOutside: (event) {
                focus.unfocus();
                controller.clear();
              },
              focusNode: focus,
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: doubleValue.toStringAsFixed(2),
                helperText: 'ratio multiplier: $ratio',
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                value = value == '' ? '0' : value;

                double newDouble = double.tryParse(value) ?? 0;

                newDouble = newDouble / ratio;

                // Notify sms that it has a new value.
                context.read<ValueBloc>().add(SetValueEvent(newDouble));
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
                FilteringTextInputFormatter.allow(RegExp(r'\d+\.?\d*')),
              ],
            ),
          );
        } else {
          return const Center(child: Text('nem sei, mor fita'));
        }
      },
    );
  }
}
