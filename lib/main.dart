import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Timer? _timer;
  int _elapsedTime = 0; // Time in seconds
  bool _isRunning = false;
  bool _isPaused = false;

  // Start or resume the timer
  void _startTimer() {
    if (_isPaused) {
      setState(() {
        _isRunning = true;
        _isPaused = false;
      });
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          _elapsedTime++;
        });
      });
    }
  }

  // Pause the timer
  void _pauseTimer() {
    setState(() {
      _isRunning = false;
      _isPaused = true;
      _timer?.cancel();
    });
  }

  // Reset the timer
  void _resetTimer() {
    setState(() {
      _elapsedTime = 0;
      _isRunning = false;
      _isPaused = false;
      _timer?.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Ensure the timer is disposed of when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_elapsedTime / 60).floor();
    final seconds = _elapsedTime % 60;

    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the timer
            Text(
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),

            // Start, Pause, and Reset buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? null : _startTimer, // Disable Start when running
                  child: Text('Start'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _isRunning ? _pauseTimer : null, // Disable Pause when not running
                  child: Text('Pause'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
