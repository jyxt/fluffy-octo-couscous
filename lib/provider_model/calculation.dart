import 'package:flutter/foundation.dart';
import 'package:proto_calc/common.dart';

class Calculation extends ChangeNotifier {
  int mem = 0;
  int cur = 0;
  Operator operator = Operator.equal;

  String get displayValue {
    return cur.toString();
  }

  void addDigit(int digit) {
    cur = cur * 10 + digit;
    notifyListeners();
  }

  void add() {
    operator = Operator.add;
    mem = cur;
    cur = 0;
    notifyListeners();
  }

  void subtract() {
    operator = Operator.subtract;
    mem = cur;
    cur = 0;
    notifyListeners();
  }

  void equal() {
    switch (operator) {
      case Operator.add:
        cur += mem;
        break;
      case Operator.subtract:
        cur = mem - cur;
        break;
      case Operator.equal:
        break;
    }
    notifyListeners();
  }
}
