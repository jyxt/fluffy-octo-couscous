enum Operator { add, subtract, multiply, divide, equal, value }

class ButtonData {
  final Operator operator;
  final int? value;
  ButtonData({required this.operator, this.value});

  @override
  String toString() {
    switch (operator) {
      case Operator.add:
        return '+';
      case Operator.subtract:
        return '-';
      case Operator.multiply:
        return '×';
      case Operator.divide:
        return '÷';
      case Operator.equal:
        return '=';
      default:
        return value!.toString();
    }
  }
}

final calcButtonData = [
  ButtonData(operator: Operator.value, value: 7),
  ButtonData(operator: Operator.value, value: 8),
  ButtonData(operator: Operator.value, value: 9),
  ButtonData(operator: Operator.multiply),
  ButtonData(operator: Operator.value, value: 4),
  ButtonData(operator: Operator.value, value: 5),
  ButtonData(operator: Operator.value, value: 6),
  ButtonData(operator: Operator.divide),
  ButtonData(operator: Operator.value, value: 1),
  ButtonData(operator: Operator.value, value: 2),
  ButtonData(operator: Operator.value, value: 3),
  ButtonData(operator: Operator.subtract),
  ButtonData(operator: Operator.value, value: 0),
  ButtonData(operator: Operator.equal),
  ButtonData(operator: Operator.add),
];
