import 'package:flutter/material.dart';
import 'package:projeto_json/View/CadastroView.dart';
import 'package:projeto_json/View/ListView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CadastroPage()));
                  },
                  child: Text("Cadastrar Produto")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListPage()));
                  },
                  child: Text("Listar Produtos")),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
