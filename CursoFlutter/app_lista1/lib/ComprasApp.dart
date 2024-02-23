import 'package:app_lista1/ComprasController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComprasScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova Compra
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova Compra
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Compra',
                // Ícone para adicionar Compra ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarCompra do Provider para atualizar o estado
                    Provider.of<ComprasController>(context, listen: false)
                        .adicionarCompra(_controller.text);
                    // Limpar o campo de texto após adicionar a Compra
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de Compras usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ComprasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.Compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da Compra
                      title: Text(model.Compras[index].descricao),
                      // Checkbox para marcar a Compra como concluída
                      trailing: Checkbox(
                        value: model.Compras[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                      // Exclui a Compra ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirCompra do Provider para atualizar o estado
                        model.excluirCompra(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
