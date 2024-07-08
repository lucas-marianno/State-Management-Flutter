part of 'value_bloc.dart';

sealed class ValueEvent extends Equatable {
  const ValueEvent();

  @override
  List<Object> get props => [];
}

class LoadInitialValueEvent extends ValueEvent {}

class SetValueEvent extends ValueEvent {
  final double value;

  const SetValueEvent(this.value);

  @override
  List<Object> get props => [value];
}
