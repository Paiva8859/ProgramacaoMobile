import 'package:flutter/material.dart';

class RowsColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rows e Columns Exercício"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Elementos Organizados Horizontalmente:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_filled_outlined),
                  SizedBox(width: 10),
                  Text('Item 1'),
                  SizedBox(width: 20),
                  Icon(Icons.account_circle_sharp),
                  SizedBox(width: 10),
                  Text('Item 2'),
                  SizedBox(width: 20),
                  Icon(Icons.military_tech_sharp),
                  SizedBox(width: 10),
                  Text('Item 3'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Elementos Organizados Verticalmente:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.tablet_android),
                  SizedBox(height: 10),
                  Text('Item A'),
                  SizedBox(height: 20),
                  Icon(Icons.add_box),
                  SizedBox(height: 10),
                  Text('Item B'),
                  SizedBox(height: 20),
                  Icon(Icons.ac_unit),
                  SizedBox(height: 10),
                  Text('Item C'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(RowsColumns());
}
