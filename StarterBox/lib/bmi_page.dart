import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _bmiResult = "";

  void _calculateBMI() {
    double? weight = double.tryParse(_weightController.text);
    double? height = double.tryParse(_heightController.text);
    if (weight != null && height != null && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        _bmiResult = "BMI: ${bmi.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _weightController, decoration: InputDecoration(labelText: 'Weight (kg)')),
            TextField(controller: _heightController, decoration: InputDecoration(labelText: 'Height (m)')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _calculateBMI, child: Text('Calculate')),
            SizedBox(height: 20),
            Text(_bmiResult, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}