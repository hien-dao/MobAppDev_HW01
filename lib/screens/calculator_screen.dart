import 'package:flutter/material.dart';
import '../widgets/calculator_button.dart';
import '../logic/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const CalculatorScreen({super.key, required this.onToggleTheme});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic _logic = CalculatorLogic();
  String get _display => _logic.output.isEmpty ? _logic.input : _logic.output;
  final List<String> _buttons = [
    'C', 'DEL', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '+/-', '.', '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Calculator',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                _display,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                final text = _buttons[index];
                VoidCallback onPressed;
                switch (text) {
                  case 'C':
                    onPressed = _logic.clear;
                    break;
                  case 'DEL':
                    onPressed = _logic.delete;
                    break;
                  case '=':
                    onPressed = _logic.calculate;
                    break;
                  default:
                    onPressed = () => _logic.addInput(text);
                }
                return CalculatorButton(text: text, onPressed: onPressed);
              },
            ),
            
          ],
        ),
      
    );
  }
}