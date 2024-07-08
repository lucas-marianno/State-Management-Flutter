import 'package:equatable/equatable.dart';

class Value extends Equatable {
  final double value;

  const Value(this.value);

  @override
  List<Object?> get props => [value];
}
