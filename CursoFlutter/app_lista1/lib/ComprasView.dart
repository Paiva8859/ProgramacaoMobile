import 'package:flutter/material.dart';
import 'package:app_lista1/ComprasController.dart';
import 'package:provider/provider.dart';

class ListaComprasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Consumer<ComprasController>(
        builder: (context, controller, _) {
          return ListView.builder(
            itemCount: controller.itens.length,
            itemBuilder: (context, index) {
              final item = controller.itens[index];
              return ListTile(
                title: Text(item.nome),
                trailing: Checkbox(
                  value: item.concluido,
                  onChanged: (value) {
                    controller.marcarItemComoConcluido(index, value!);
                  },
                ),
                onLongPress: () {
                  controller.removerItem(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _adicionarItem(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _adicionarItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _controller = TextEditingController();
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Nome do item'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final nome = _controller.text;
                if (nome.isNotEmpty) {
                  Provider.of<ComprasController>(context, listen: false)
                      .adicionarItem(nome);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
