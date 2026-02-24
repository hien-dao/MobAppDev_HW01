import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const CalculatorScreen({super.key, required this.onToggleTheme});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
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
      body: const Center(
        child: Text('Calculator UI goes here'),
      ),
    );
  }
}