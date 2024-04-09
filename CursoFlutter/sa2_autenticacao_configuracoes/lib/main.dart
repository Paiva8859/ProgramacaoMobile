import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/model_theme.dart';

import 'view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, modelTheme, child) {
          return MaterialApp(
            title: 'SA2',
            theme: modelTheme.isDark ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: Theme(
              data: modelTheme.isDark ? ThemeData.dark() : ThemeData.light(),
              child: LoginView(),
            ),
          );
        },
      ),
    );
  }
}
