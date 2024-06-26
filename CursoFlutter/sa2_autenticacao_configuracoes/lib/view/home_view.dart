import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'login_view.dart';
import '../Utils/database_helper.dart';
import '../Utils/settings_manager.dart';

class HomeView extends StatefulWidget {
  final String username;

  HomeView({required this.username});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late bool _darkMode = false;
  late double _fontSize = 16.0;
  late DatabaseHelper _databaseHelper;
  late SettingsManager _settingsManager;

  @override
  void initState() {
    super.initState();
    _initDatabase();
    _settingsManager = SettingsManager();
    _loadPreferences();
  }

  Future<void> _initDatabase() async {
    _databaseHelper = DatabaseHelper();
    await _databaseHelper.initDb();
  }

  Future<void> _loadPreferences() async {
    _darkMode = (await _settingsManager.getTheme(widget.username) ?? 'light') == 'dark';
    _fontSize = (await _settingsManager.getFontSize(widget.username) ?? 16.0);
    _updateTheme(); // Atualize o tema ao carregar as preferências
  }

  void _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _settingsManager.saveTheme(widget.username, _darkMode ? 'dark' : 'light');
    _updateTheme();
  }

  void _updateTheme() {
    final brightness = _darkMode ? Brightness.dark : Brightness.light;
    // ignore: unused_local_variable
    final themeData = ThemeData(
      brightness: brightness,
    );
    setState(() {
    });
  }

  void _increaseFontSize() async {
    setState(() {
      _fontSize += 1.0;
    });
    await _settingsManager.saveFontSize(widget.username, _fontSize);
  }

  void _decreaseFontSize() async {
    setState(() {
      _fontSize -= 1.0;
    });
    await _settingsManager.saveFontSize(widget.username, _fontSize);
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
      await _databaseHelper.deleteUser(widget.username);

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/authentication.db');
      if (await file.exists()) {
        await file.delete();
      }

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
    return Theme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Home')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo à tela inicial, ${widget.username}!',
                style: TextStyle(fontSize: _fontSize),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleDarkMode,
                child: Text(_darkMode ? 'Modo Claro' : 'Modo Escuro'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _darkMode ? Colors.blueGrey : Colors.blue,
                  textStyle: TextStyle(fontSize: 16),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decreaseFontSize,
                    child: Icon(Icons.remove),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _increaseFontSize,
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteUser,
                child: Text('Excluir Usuário'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 16),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _logout,
                child: Text('Sair'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  textStyle: TextStyle(fontSize: 16),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
