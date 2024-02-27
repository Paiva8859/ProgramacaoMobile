import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero = TextEditingController();
  String _resultado = '';
  bool _reiniciar = false;
  int _contador = 0;

  void _exe(String operacao) {
    double numero = double.tryParse(_controllerNumero.text) ?? 0.0;
    int n = Random().nextInt(100) + 1;
    String resultado = "";

    if (operacao == "Tentar") {
      _contador++; // Incremento do contador a cada tentativa
      if (n == numero) {
        resultado = "Parabéns, você acertou em $_contador tentativa(s)";
        _reiniciar = true;
      } else if (n > numero) {
        resultado = "Tente um número maior, você já fez $_contador tentativa(s)";
      } else {
        resultado = "Tente um número menor, você já fez $_contador tentativa(s)";
      }
    } else {
      _contador = 0; // Reinicia o contador se não for uma tentativa
    }

    setState(() {
      _resultado = resultado;
    });
  }

  void _reiniciarJogo() {
    _controllerNumero.clear();
    _resultado = '';
    _reiniciar = false;
    _contador = 0; // Reinicia o contador ao jogar novamente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo de Adivinhação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Diga um número'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _exe('Tentar'),
              child: Text('Tentar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Visibility(
              visible: _reiniciar,
              child: ElevatedButton(
                onPressed: _reiniciarJogo,
                child: Text('Jogar Novamente'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
