part of 'value_bloc.dart';

sealed class ValueState extends Equatable {
  const ValueState();

  @override
  List<Object> get props => [];
}

final class ValueInitialState extends ValueState {}

final class ValueLoadedState extends ValueState {
  final double value;

  const ValueLoadedState(this.value);

  @override
  List<Object> get props => [value];
}
