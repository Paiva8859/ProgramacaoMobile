import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ComprasController.dart';
import 'ComprasView.dart';

void main() {
  runApp(ComprasApp());
}

class ComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComprasController(),
      child: MaterialApp(
        title: 'Lista de Compras',
        home: ComprasView(),
      ),
    );
  }
}