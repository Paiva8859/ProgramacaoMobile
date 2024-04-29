import 'package:flutter/material.dart';
import 'package:projeto_json/View/HomeView.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto Json",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage()
    );
  }
}
