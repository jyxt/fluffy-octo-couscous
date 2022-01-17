// part of 'calculation_cubit.dart';

// @freezed
// class CalculationState with _$CalculationState {
//   const factory CalculationState.initial() = _Initial;
// }

part of 'calculation_cubit.dart';

class CalculationState extends Equatable {
  final int mem;
  final int cur;
  final Operator operator;

  const CalculationState(
      {required this.mem, required this.cur, required this.operator});

  @override
  List<Object?> get props => [mem, cur, operator];

  String get displayValue => cur.toString();
}
