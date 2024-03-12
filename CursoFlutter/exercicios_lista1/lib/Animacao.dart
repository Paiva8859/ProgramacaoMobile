import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click and Move Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double _xPosition;
  late double _yPosition;
  Color _currentColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _xPosition = MediaQuery.of(context).size.width / 2 - 50; // metade da largura - metade da largura do quadrado
    _yPosition = MediaQuery.of(context).size.height / 2 - 50; // metade da altura - metade da altura do quadrado
  }

  void _updatePosition(DragUpdateDetails details) {
    setState(() {
      _xPosition += details.delta.dx;
      _yPosition += details.delta.dy;
    });
  }

  void _changeColor() {
    setState(() {
      _currentColor = _currentColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click and Move Widget'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _xPosition,
            top: _yPosition,
            child: GestureDetector(
              onTap: _changeColor,
              onPanUpdate: _updatePosition,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: _currentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Click me!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
