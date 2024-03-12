
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarExemplo(),
    );
  }
}

class TabBarExemplo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Define o número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Conteúdo da Tab 1
            Center(
              child: Text('Conteúdo da Tab 1'),
            ),
            // Conteúdo da Tab 2
            Center(
              child: Text('Conteúdo da Tab 2'),
            ),
            // Conteúdo da Tab 3
            Center(
              child: Text('Conteúdo da Tab 3'),
            ),
          ],
        ),
      ),
    );
  }
}
