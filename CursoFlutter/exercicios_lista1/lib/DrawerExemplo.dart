import 'package:flutter/material.dart';

class DrawerExemplo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawer Exemplo'),
        ),
        drawer: Drawer(
          child: Text("Drawer Aberto"),
        ),
      ),
    );
  }
}

void main() {
  runApp(DrawerExemplo());
}
