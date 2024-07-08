import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'value_event.dart';
part 'value_state.dart';

class ValueBloc extends Bloc<ValueEvent, ValueState> {
  ValueBloc() : super(ValueInitialState()) {
    on<LoadInitialValueEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));

      emit(const ValueLoadedState(0));
    });

    on<SetValueEvent>((event, emit) {
      emit(ValueLoadedState(event.value));
    });
  }
}
