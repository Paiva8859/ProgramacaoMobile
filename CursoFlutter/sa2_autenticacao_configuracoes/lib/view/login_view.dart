import 'package:flutter/material.dart';
import 'package:sa2_autenticacao_configuracoes/Utils/database_helper.dart' as dbHelper;
import 'package:sa2_autenticacao_configuracoes/view/home_view.dart';
import 'package:sa2_autenticacao_configuracoes/view/register_view.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = _usernameController.text.trim();
                final password = _passwordController.text.trim();
                final user = await dbHelper.DatabaseHelper().getUser(username, password); // Usando o prefixo dbHelper
                if (user != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Credenciais incorretas. Tente novamente.'),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RegisterView();
                  },
                );
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
