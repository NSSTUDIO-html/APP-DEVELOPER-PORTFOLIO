import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
            SizedBox(height: 20),
            Text("Sunny, 30°C", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}