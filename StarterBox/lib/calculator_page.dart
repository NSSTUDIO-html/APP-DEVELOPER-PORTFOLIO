import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = "0";
  String _input = "";
  double? num1;
  double? num2;
  String? operand;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        output = "0";
        num1 = num2 = 0;
        operand = null;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        num1 = double.tryParse(_input);
        operand = buttonText;
        _input = "";
      } else if (buttonText == "=") {
        num2 = double.tryParse(_input);
        if (num1 != null && num2 != null && operand != null) {
          if (operand == "+") output = (num1! + num2!).toString();
          if (operand == "-") output = (num1! - num2!).toString();
          if (operand == "*") output = (num1! * num2!).toString();
          if (operand == "/") output = (num1! / num2!).toString();
          _input = output;
        }
      } else {
        _input += buttonText;
        output = _input;
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          child: Text(buttonText, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(output, style: TextStyle(fontSize: 40)),
            ),
          ),
          Row(children: ["7", "8", "9", "/"].map(_buildButton).toList()),
          Row(children: ["4", "5", "6", "*"].map(_buildButton).toList()),
          Row(children: ["1", "2", "3", "-"].map(_buildButton).toList()),
          Row(children: ["0", ".", "=", "+"].map(_buildButton).toList()),
          Row(children: ["C"].map(_buildButton).toList()),
        ],
      ),
    );
  }
}