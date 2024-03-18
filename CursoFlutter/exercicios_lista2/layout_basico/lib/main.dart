import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Básico'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                child: Text(
                  'Container',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add_reaction,
                    size: 50.0,
                    color: Colors.yellow,
                  ),
                  Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  Image.asset(
                    '',
                    width: 50.0,
                    height: 50.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
