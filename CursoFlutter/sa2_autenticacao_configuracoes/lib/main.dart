import 'package:flutter/material.dart';
import 'package:sa2_autenticacao_configuracoes/view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autenticação e Configurações',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginView(),
    );
  }
}
