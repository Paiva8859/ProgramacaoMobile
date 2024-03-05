import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Exercício"),
          titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          backgroundColor: Color.fromRGBO(136, 119, 87, 1),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: Column(
                children: [
                  Text("Filho 1", style: TextStyle(color: Colors.red)),
                  Text("Filho 2", style: TextStyle(color: Colors.yellow)),
                  Text("Filho 3", style: TextStyle(color: Colors.purple)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ContainerList());
}
