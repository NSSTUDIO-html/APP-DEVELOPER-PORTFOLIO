import 'package:flutter/material.dart';
import 'todo_page.dart';
import 'notes_page.dart';
import 'calculator_page.dart';
import 'timer_page.dart';
import 'bmi_page.dart';
import 'quiz_page.dart';
import 'weather_page.dart';
import 'flashlight_page.dart';

void main() {
  runApp(StarterBoxApp());
}

class StarterBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarterBox',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final tools = [
    {'title': 'To-Do List', 'page': TodoPage()},
    {'title': 'Notes', 'page': NotesPage()},
    {'title': 'Calculator', 'page': CalculatorPage()},
    {'title': 'Timer', 'page': TimerPage()},
    {'title': 'BMI Calculator', 'page': BMIPage()},
    {'title': 'Quiz', 'page': QuizPage()},
    {'title': 'Weather', 'page': WeatherPage()},
    {'title': 'Flashlight', 'page': FlashlightPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StarterBox Tools')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => tools[index]['page'] as Widget),
                );
              },
              child: Text(tools[index]['title'] as String),
            ),
          );
        },
      ),
    );
  }
}