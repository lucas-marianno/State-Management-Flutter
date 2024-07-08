import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_test/bloc/value_bloc.dart';
import 'package:provider_test/level1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('$MyApp was rebuilt');

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ValueBloc()..add(LoadInitialValueEvent())),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ValueBloc, ValueState>(
          builder: (context, state) {
            if (state is ValueInitialState) {
              return const Center(child: LinearProgressIndicator());
            }
            if (state is ValueLoadedState) {
              final title = state.value.toStringAsFixed(2);

              return AppBar(title: Text(title));
            } else {
              return const Center(child: Text('SHIT'));
            }
          },
        ),
      ),
      body: const Level1(),
    );
  }
}
