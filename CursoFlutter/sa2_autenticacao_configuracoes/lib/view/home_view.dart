import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/database_helper.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SharedPreferences? _prefs;
  bool _darkMode = false;
  double _fontSize = 16.0;
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _initDatabase();
    _loadPreferences();
  }

  Future<void> _initDatabase() async {
    _databaseHelper = DatabaseHelper();
    await _databaseHelper.initDb();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs!.getBool('darkMode') ?? false;
      _fontSize = _prefs!.getDouble('fontSize') ?? 16.0;
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _darkMode = !_darkMode;
    });
    _prefs!.setBool('darkMode', _darkMode);
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 1.0;
    });
    _prefs!.setDouble('fontSize', _fontSize);
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 1.0;
    });
    _prefs!.setDouble('fontSize', _fontSize);
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
      (route) => false,
    );
  }

  Future<void> _deleteUser() async {
  try {
    final username = 'username'; // Substitua 'username' pelo nome de usuário que deseja excluir
    await _databaseHelper.deleteUser(username);

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/authentication.db');
    if (await file.exists()) {
      await file.delete();
    }

    await _prefs!.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuário excluído com sucesso'),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      _logout();
    });
  } catch (e) {
    print('Erro ao excluir usuário: $e');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao excluir usuário. Tente novamente.'),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo à tela inicial!',
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleDarkMode,
              child: Text(_darkMode ? 'Modo Claro' : 'Modo Escuro'),
            ),
            ElevatedButton(
              onPressed: _increaseFontSize,
              child: Text('Aumentar Fonte'),
            ),
            ElevatedButton(
              onPressed: _decreaseFontSize,
              child: Text('Diminuir Fonte'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Excluir Usuário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
