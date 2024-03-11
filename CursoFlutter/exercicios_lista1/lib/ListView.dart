import 'package:flutter/material.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView com Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text('ListView com Cards'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Descrição do Item ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
