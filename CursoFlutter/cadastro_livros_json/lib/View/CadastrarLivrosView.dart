import 'package:flutter/material.dart';

class CadastrarLivroPage extends StatefulWidget {
  const CadastrarLivroPage({super.key});

  @override
  State<CadastrarLivroPage> createState() => _CadastrarLivroPageState();
}

class _CadastrarLivroPageState extends State<CadastrarLivroPage> {
  final TextEditingController _controllerLivros = TextEditingController();
  final TextEditingController _controllerAutor = TextEditingController();
  final TextEditingController _controllerEditora = TextEditingController();
  final TextEditingController _controllerSinopse = TextEditingController();
  final TextEditingController _controllerCapa = TextEditingController();
  final TextEditingController _controllerISBN = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Livro"),
      ),
      body: Center(
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Titulo",
              ),
              controller: _controllerLivros,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira um titulo';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Autor",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira um autor';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Editora",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira uma editora';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Sinopse",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira uma sinopse';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Capa",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira um valor';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Preco",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira um preco';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Categoria",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira uma categoria';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Editora",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira uma editora';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "ISBN",
              ),
              controller: TextEditingController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'insira um isbn';
                }
                return null;
              },
            ),
          ],
        )),
      ),
    );
  }
}
