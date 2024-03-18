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
        title: Text('Exemplo Stack'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
            ),
            Container(
              width: 150.0,
              height: 150.0,
              color: Colors.red,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
            ),
            Container(
              width: 50.0,
              height: 50.0,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    ));
  }
}
