import 'package:app_animais/AnimalModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AnimalController.dart';

class AnimalView extends StatelessWidget {
  // Controlador para o campo de texto de Novo Animal
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Animais'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar Novo Animal
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Animal',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarAnimal do Provider para atualizar o estado
                    Provider.of<AnimalModel>(context, listen: false)
                        .adicionarAnimal(_controller.text, "", "");
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Animais usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<AnimalModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarAnimais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.listarAnimais[index].descricao),
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
