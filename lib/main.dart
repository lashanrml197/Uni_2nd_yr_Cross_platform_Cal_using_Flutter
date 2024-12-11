import 'package:flutter/material.dart';
import 'calculator_ui.dart';
import 'calculator_operations.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorOperations _calculatorOperations = CalculatorOperations();

  void _onButtonPressed(String value) {
    setState(() {
      _calculatorOperations.onButtonPressed(value, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CalculatorUI(
      displayText: _calculatorOperations.displayText,
      onButtonPressed: _onButtonPressed,
    );
  }
}
