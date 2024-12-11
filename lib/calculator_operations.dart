import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

class CalculatorOperations {
  String expression = '';
  String displayText = '0';

  void onButtonPressed(String value, BuildContext context) {
    if (value == 'AC') {
      clearAll();
    } else if (value == '⌫') {
      deleteLast();
    } else if (value == '=' && expression.isNotEmpty) {
      evaluateExpression(context);
    } else {
      if (value == '%' || value == '√') {
        handleAdvancedOperations(value, context);
      } else {
        appendToExpression(value);
      }
    }
  }

  void clearAll() {
    expression = '';
    displayText = '0';
  }

  void deleteLast() {
    expression = expression.isNotEmpty
        ? expression.substring(0, expression.length - 1)
        : '';
    displayText = expression.isEmpty ? '0' : expression;
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text(
            "Error",
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Can't divide by zero.",
            style: TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void evaluateExpression(BuildContext context) {
    try {
      if (RegExp(r'(/|÷)0+$').hasMatch(expression)) {
        displayText = 'Error';
        showErrorDialog(context);
        return;
      }

      if (expression.endsWith('+') ||
          expression.endsWith('-') ||
          expression.endsWith('×') ||
          expression.endsWith('÷')) {
        expression = expression.substring(0, expression.length - 1);
      }

      Parser parser = Parser();
      Expression exp =
          parser.parse(expression.replaceAll('×', '*').replaceAll('÷', '/'));
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      displayText = eval.toString();
      expression = eval.toString(); //Update the expression to the result
    } catch (e) {
      displayText = 'Error';
    }
  }

  void appendToExpression(String value) {
    if (expression.endsWith('+') ||
        expression.endsWith('-') ||
        expression.endsWith('×') ||
        expression.endsWith('÷')) {
      if (value == '+' || value == '-' || value == '×' || value == '÷') {
        return; //Avoid multiple consecutive operators
      }
    }
    expression += value;
    displayText = expression;
  }

  void handleAdvancedOperations(String value, BuildContext context) {
    try {
      if (expression.endsWith('+') ||
          expression.endsWith('-') ||
          expression.endsWith('×') ||
          expression.endsWith('÷')) {
        expression = expression.substring(0, expression.length - 1);
      }

      Parser parser = Parser();
      Expression exp =
          parser.parse(expression.replaceAll('×', '*').replaceAll('÷', '/'));
      ContextModel cm = ContextModel();
      double number = exp.evaluate(EvaluationType.REAL, cm);

      if (value == '%') {
        displayText = (number * 0.01).toString();
      } else if (value == '√') {
        if (number < 0) {
          displayText = 'Error';
          showErrorDialog(context);
          return;
        }
        displayText = sqrt(number).toString();
      }

      expression = displayText;
    } catch (e) {
      displayText = 'Error';
    }
  }
}
