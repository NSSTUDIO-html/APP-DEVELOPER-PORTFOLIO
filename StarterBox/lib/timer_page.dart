import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 60;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) _seconds--;
        else _timer?.cancel();
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() => _seconds = 60);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_seconds", style: TextStyle(fontSize: 60)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _startTimer, child: Text("Start")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: _resetTimer, child: Text("Reset")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}