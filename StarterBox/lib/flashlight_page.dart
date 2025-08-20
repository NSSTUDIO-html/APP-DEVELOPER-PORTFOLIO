import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightPage extends StatefulWidget {
  @override
  _FlashlightPageState createState() => _FlashlightPageState();
}

class _FlashlightPageState extends State<FlashlightPage> {
  bool _isOn = false;

  Future<void> _toggleFlashlight() async {
    try {
      if (_isOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        _isOn = !_isOn;
      });
    } on Exception catch (e) {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flashlight')),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(_isOn ? Icons.flash_on : Icons.flash_off, size: 40),
          label: Text(_isOn ? 'Turn Off' : 'Turn On', style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          onPressed: _toggleFlashlight,
        ),
      ),
    );
  }
}