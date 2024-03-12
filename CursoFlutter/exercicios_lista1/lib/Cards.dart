import 'package:flutter/material.dart';

void main() {
  runApp(Cards());
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text('Card Exemplo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CardWidget(
              title: 'Card 1',
              description: 'Descrição',
              imagePath: 'image.jpg',
            ),
            CardWidget(
              title: 'Card 2',
              description: 'Descrição',
              imagePath: 'image.jpg',
            ),
            CardWidget(
              title: 'Card 3',
              description: 'Descrição',
              imagePath: 'image.jpg',
            ),
          ],
        ),
      )
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  CardWidget({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
