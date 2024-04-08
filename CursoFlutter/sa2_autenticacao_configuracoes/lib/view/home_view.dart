import 'package:flutter/material.dart';
import 'package:sa2_autenticacao_configuracoes/Utils/database_helper.dart';
import 'package:sa2_autenticacao_configuracoes/view/login_view.dart';
import 'package:sa2_autenticacao_configuracoes/utils/settings_manager.dart';

class HomeView extends StatefulWidget {
  final String username;

  HomeView({required this.username});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late DatabaseHelper _databaseHelper;
  late SettingsManager _settingsManager;
  bool _darkMode = false;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _settingsManager = SettingsManager();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _darkMode = (await _settingsManager.getTheme(widget.username)) == 'dark';
    _fontSize = (await _settingsManager.getFontSize(widget.username)) ?? 16.0;
    setState(() {});
  }

  void _toggleDarkMode() async {
    _darkMode = !_darkMode;
    await _settingsManager.saveTheme(widget.username, _darkMode ? 'dark' : 'light');
    setState(() {});
  }

  void _increaseFontSize() async {
    setState(() {
      _fontSize += 1.0;
    });
    await _settingsManager.saveFontSize(widget.username, _fontSize.toString());
  }

  void _decreaseFontSize() async {
    setState(() {
      _fontSize -= 1.0;
    });
    await _settingsManager.saveFontSize(widget.username, _fontSize.toString());
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
      final result = await _databaseHelper.deleteUser(widget.username);
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário excluído com sucesso'),
            duration: Duration(seconds: 2),
          ),
        );
        Future.delayed(Duration(seconds: 2), () {
          _logout();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Nenhum usuário encontrado para excluir.'),
          ),
        );
      }
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
    return MaterialApp(
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
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
      ),
    );
  }
}
