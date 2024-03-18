import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _progressValue = 0.0;

  void _startTask() {
    setState(() {
      _progressValue = 0.0;
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.1;
        } else {
          timer.cancel(); 
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barra de Progresso Dinâmica'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startTask,
                child: Text('Iniciar Tarefa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
