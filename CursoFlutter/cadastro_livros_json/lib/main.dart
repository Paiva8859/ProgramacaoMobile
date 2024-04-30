import 'package:cadastro_livros_json/View/CadastrarLivrosView.dart';
import 'package:cadastro_livros_json/View/HomeView.dart';
import 'package:cadastro_livros_json/View/ListarLivrosView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livraria",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,

      routes: {
        '/home':(context) => HomePage(),
        '/cadastro':(context) => CadastrarLivroPage(),
        'listar':(context) => ListarLivrosPage()  
      }
    );
  }
}
