import 'package:flutter/material.dart';

class FormContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Form Cadastro'),
            titleTextStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
        body: Center(
            child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mensagem'),
              maxLines: null,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enviar'),
            ),
          ],
        )),
      ),
    );
  }
}

void main() {
  runApp(FormContato());
}
