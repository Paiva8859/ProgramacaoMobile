import 'package:flutter/material.dart';

void main() {
  runApp(MediaQueryExemplo());
}

class MediaQueryExemplo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double textSize = screenWidth * 0.05;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MediaQuery Exemplo'),
        ),
        body: Center(
          child: Container(
            width: screenWidth * 0.8,
            padding: EdgeInsets.all(16.0),
            color: Color.fromARGB(255, 187, 255, 0),
            child: Text(
              'Texto Responsivo',
              style: TextStyle(fontSize: textSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
