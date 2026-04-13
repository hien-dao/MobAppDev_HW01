import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String _input = '';
  String _output = '';

  String get input => _input;
  String get output => _output;

  bool _isValidExpression(String input) {
    if (input.isEmpty) return false;

    // Prevent ending with operator
    if (['+', '-', '*', '/'].contains(input[input.length - 1])) {
      return false;
    }

    // Prevent double operators
    if (input.contains(RegExp(r'[+\-*/]{2,}'))) {
      return false;
    }

    // Prevent multiple decimals in a number
    if (input.contains(RegExp(r'\.\.'))) {
      return false;
    }

    return true;
  }

  void addInput(String value) {
    if (_output.isNotEmpty) {
      _input = '';
      _output = '';
    }

    if (_input.isEmpty && ['+', '*', '/', '%'].contains(value)) return;

    if (value == '%') {
      _input += '/100';
    } else {
      _input += value;
    }
  }

  void delete() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    } else {
      _output = '';
    }
  }

  void clear() {
    _input = '';
    _output = '';
  }

  void calculate() {
    if (!_isValidExpression(_input)) {
      _output = 'Invalid';
      return;
    }

    try {
      final result = _evaluate(_input);

      if (result.isNaN || result.isInfinite) {
        _output = 'Math Error';
      } else {
        _output = result.toString();
      }
    } catch (e) {
      _output = 'Error';
      // Optional: debug log
      print('Calculation error: $e');
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