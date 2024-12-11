import 'package:flutter/material.dart';

//Calculator UI is a stateless widget that meaning it does not maintain any internal state
class CalculatorUI extends StatelessWidget {
  final String displayText;
  final Function(String) onButtonPressed;

  CalculatorUI(
      {required this.displayText,
      required this.onButtonPressed}); //Constructor of calculator UI class

  // Method to build the button widget
  Widget buildButton(String text,
      {Color? color, Function()? onPressed, double flex = 1}) {
    return Expanded(
      flex: flex.toInt(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.blueGrey[700],
              padding: const EdgeInsets.all(22),
              elevation: 5,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed:
                onPressed, //onPressed function is called when the button is pressed
            child: Text(
              text,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.grey[900]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.white54),
          Column(
            children: [
              Row(
                children: [
                  buildButton('C',
                      color: Colors.redAccent,
                      onPressed: () => onButtonPressed('AC')),
                  buildButton('⌫',
                      color: Colors.orangeAccent,
                      onPressed: () => onButtonPressed('⌫')),
                  buildButton('%',
                      color: Colors.orangeAccent,
                      onPressed: () => onButtonPressed('%')),
                  buildButton('÷',
                      color: Colors.deepOrange,
                      onPressed: () => onButtonPressed('÷')),
                ],
              ),
              Row(
                children: [
                  buildButton('7', onPressed: () => onButtonPressed('7')),
                  buildButton('8', onPressed: () => onButtonPressed('8')),
                  buildButton('9', onPressed: () => onButtonPressed('9')),
                  buildButton('×',
                      color: Colors.deepOrange,
                      onPressed: () => onButtonPressed('×')),
                ],
              ),
              Row(
                children: [
                  buildButton('4', onPressed: () => onButtonPressed('4')),
                  buildButton('5', onPressed: () => onButtonPressed('5')),
                  buildButton('6', onPressed: () => onButtonPressed('6')),
                  buildButton('-',
                      color: Colors.deepOrange,
                      onPressed: () => onButtonPressed('-')),
                ],
              ),
              Row(
                children: [
                  buildButton('1', onPressed: () => onButtonPressed('1')),
                  buildButton('2', onPressed: () => onButtonPressed('2')),
                  buildButton('3', onPressed: () => onButtonPressed('3')),
                  buildButton('+',
                      color: Colors.deepOrange,
                      onPressed: () => onButtonPressed('+')),
                ],
              ),
              Row(
                children: [
                  buildButton('√',
                      color: Colors.blueAccent,
                      onPressed: () => onButtonPressed('√')),
                  buildButton('0', onPressed: () => onButtonPressed('0')),
                  buildButton('.', onPressed: () => onButtonPressed('.')),
                  buildButton('=',
                      color: Colors.green,
                      onPressed: () => onButtonPressed('=')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
