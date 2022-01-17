import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:proto_calc/common.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit()
      : super(const CalculationState(
          mem: 0,
          cur: 0,
          operator: Operator.equal,
        ));

  void addDigit(int digit) {
    emit(CalculationState(
      mem: state.mem,
      cur: state.cur * 10 + digit,
      operator: state.operator,
    ));
  }

  void add() {
    emit(CalculationState(mem: state.cur, cur: 0, operator: Operator.add));
  }

  void subtract() {
    emit(CalculationState(mem: state.cur, cur: 0, operator: Operator.subtract));
  }

  void equal() {
    switch (state.operator) {
      case Operator.add:
        emit(CalculationState(
            mem: state.mem,
            cur: state.cur + state.mem,
            operator: state.operator));
        break;
      case Operator.subtract:
        emit(CalculationState(
            mem: state.mem,
            cur: state.mem - state.cur,
            operator: state.operator));
        break;
    }
  }
}
