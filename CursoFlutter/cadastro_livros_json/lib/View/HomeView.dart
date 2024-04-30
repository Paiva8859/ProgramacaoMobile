import 'package:cadastro_livros_json/View/CadastrarLivrosView.dart';
import 'package:cadastro_livros_json/View/ListarAutoresPage.dart';
import 'package:cadastro_livros_json/View/ListarLivrosView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Livraria")),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListarLivrosPage()));
                      },
                      child: Text("Listar Livros")),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListarAutoresPage()));
                      },
                      child: Text("Listar Autores")),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastrarLivroPage()));
                      },
                      child: Text("Cadastrar Livro"))
                ]))));
  }
}
