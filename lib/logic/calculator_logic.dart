import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String _input = '';
  String _output = '';

  String get input => _input;
  String get output => _output;

  void addInput(String value) {
    _input += value;
  }

  void delete() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
  }

  void clear() {
    _input = '';
    _output = '';
  }

  void calculate() {
    try {
      // VERY basic (you'll improve later)
      final result = _evaluate(_input);
      _output = result.toString();
    } catch (e) {
      _output = 'Error';
    }
  }

  double _evaluate(String expression) {
    // ⚠️ Placeholder logic
    // You’ll likely replace this with a parser later
    return double.parse(expression);
  }

  void deleteLast() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
  }

  void toggleSign() {
    if (_input.startsWith('-')) {
      _input = _input.substring(1);
    } else {
      _input = '-$_input';
    }
  }
}