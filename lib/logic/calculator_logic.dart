import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String _input = '';
  String _output = '';

  String get input => _input;
  String get output => _output;

  void addInput(String value) {
    if (_input.isEmpty && ['+', '*', '/'].contains(value)) return;
    _input += value;
    if (value == '%') {
    _input += '/100';
  }
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
      final result = _evaluate(_input);
      _output = result.toString();
    } catch (e) {
      _output = 'Error';
    }
  }

  void toggleSign() {
    if (_input.startsWith('-')) {
      _input = _input.substring(1);
    } else {
      _input = '-$_input';
    }
  }

  double _evaluate(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }
}