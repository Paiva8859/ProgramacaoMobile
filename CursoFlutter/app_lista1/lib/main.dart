import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ComprasView.dart';
import 'ComprasController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComprasController(),
      child: MaterialApp(
        title: 'Lista de Compras',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ComprasView(), 
      ),
    );
  }
}
