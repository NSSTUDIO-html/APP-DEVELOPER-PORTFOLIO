import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String _selected = "";
  String _result = "";

  void _checkAnswer(String answer) {
    setState(() {
      _selected = answer;
      _result = answer == "Flutter" ? "Correct!" : "Wrong!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Which framework are we using?", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => _checkAnswer("Flutter"), child: Text("Flutter")),
            ElevatedButton(onPressed: () => _checkAnswer("React Native"), child: Text("React Native")),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}