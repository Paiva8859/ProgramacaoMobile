import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ComprasController.dart';

class ComprasView extends StatefulWidget {
  @override
  _ComprasViewState createState() => _ComprasViewState();
}

class _ComprasViewState extends State<ComprasView> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Timer? _reminderTimer;
  String _selectedSortingOption = 'ordem alfabética A-Z';
  List<String> _sortingOptions = [
    'ordem alfabética A-Z',
    'ordem alfabética Z-A',
    'Preço Crescente',
    'Preço Decrescente',
    'Quantidade Crescente',
    'Quantidade Decrescente',
    'Agrupar por Categoria'
  ];

  @override
  void initState() {
    super.initState();
    // Iniciar temporizador para exibir notificações
    startReminderTimer();
  }

  @override
  void dispose() {
    _reminderTimer?.cancel(); // Cancelar o temporizador ao descartar o widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedSortingOption,
              onChanged: (value) {
                setState(() {
                  _selectedSortingOption = value!;
                  // Classificar os itens com base na opção selecionada
                  Provider.of<ComprasController>(context, listen: false)
                      .sortItems(value);
                });
              },
              items: _sortingOptions
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome do Item',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Por favor, insira o nome do item.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _quantidadeController,
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Por favor, insira a quantidade.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _precoController,
                decoration: InputDecoration(
                  labelText: 'Preço',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Por favor, insira o preço.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'O preço precisa ser um número.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _categoriaController,
                decoration: InputDecoration(
                  labelText: 'Categoria',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Por favor, insira a categoria.';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _adicionarItem(context);
                }
              },
              child: Text('Adicionar Item'),
            ),
            Expanded(
              child: Consumer<ComprasController>(
                builder: (context, model, child) {
                  double total = 0.0; // Total do valor a ser pago
                  for (var item in model.itens) {
                    total += item.preco * item.quantidade;
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.itens.length,
                          itemBuilder: (context, index) {
                            final item = model.itens[index];
                            return ListTile(
                              title: Text(item.nome),
                              subtitle: Text(
                                'Quantidade: ${item.quantidade}, Preço: R\$${item.preco.toStringAsFixed(2)}, Categoria: ${item.categoria}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: item.concluido,
                                    onChanged: (value) {
                                      model.marcarItemComoConcluido(
                                        index,
                                        value!,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit_outlined),
                                    onPressed: () {
                                      _editarItem(context, model, index);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _removerItem(context, model, index);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Total a ser pago: R\$ ${total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Iniciar temporizador para exibir notificações
  void startReminderTimer() {
    if (_reminderTimer == null || !_reminderTimer!.isActive) {
      _reminderTimer = Timer.periodic(Duration(seconds: 30), (timer) {
        showReminder();
      });
    }
  }

  // Exibir notificações
  void showReminder() {
    final controller = Provider.of<ComprasController>(context, listen: false);
    final itensPendentes =
        controller.itens.where((item) => !item.concluido).toList();

    if (itensPendentes.isNotEmpty) {
      final itemNames = itensPendentes.map((item) => item.nome).join(', ');

      // Mostrar lembrete usando SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Itens pendentes: $itemNames'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  // Adicionar item à lista
  void _adicionarItem(BuildContext context) {
    final nome = _nomeController.text.trim();
    final quantidade = int.tryParse(_quantidadeController.text) ?? 0;
    final preco = double.tryParse(_precoController.text) ?? 0.0;
    final categoria = _categoriaController.text.trim();

    final controller = Provider.of<ComprasController>(context, listen: false);

    // Verificar se já existe um item com o mesmo nome
    bool nomeExistente = controller.itens.any((item) => item.nome == nome);

    if (nomeExistente) {
      // Mostrar mensagem de erro se o nome já existir
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Um item com o mesmo nome já existe.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Adicionar o novo item se o nome for único
      controller.adicionarItem(nome, quantidade, preco, categoria);

      // Limpar os controladores após a adição do item
      _nomeController.clear();
      _quantidadeController.clear();
      _precoController.clear();
      _categoriaController.clear();
    }
  }

  // Editar item na lista
  void _editarItem(BuildContext context, ComprasController model, int index) {
    final TextEditingController _nomeEditController =
        TextEditingController(text: model.itens[index].nome.trim());
    final TextEditingController _quantidadeEditController =
        TextEditingController(text: model.itens[index].quantidade.toString());
    final TextEditingController _precoEditController =
        TextEditingController(text: model.itens[index].preco.toString());
    final TextEditingController _categoriaEditController =
        TextEditingController(text: model.itens[index].categoria.trim());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeEditController,
                decoration: InputDecoration(hintText: 'Nome do item'),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _quantidadeEditController,
                decoration: InputDecoration(hintText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _precoEditController,
                decoration: InputDecoration(hintText: 'Preço'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _categoriaEditController,
                decoration: InputDecoration(hintText: 'Categoria'),
              ),
            ],
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
                final novoNome = _nomeEditController.text.trim();
                final novaQuantidade =
                    int.tryParse(_quantidadeEditController.text) ?? 0;
                final novoPreco =
                    double.tryParse(_precoEditController.text) ?? 0.0;
                final novaCategoria = _categoriaEditController.text.trim();

                if (novoNome.isNotEmpty &&
                    novaQuantidade > 0 &&
                    novoPreco > 0 &&
                    novaCategoria.isNotEmpty) {
                  model.editarItem(index, novoNome, novaQuantidade, novoPreco,
                      novaCategoria);
                  Navigator.of(context).pop();
                } else {
                  print(
                      "Os campos nome, quantidade, preço e categoria devem ser preenchidos corretamente.");
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Remover item da lista
  void _removerItem(BuildContext context, ComprasController model, int index) {
    model.removerItem(index);
  }
}
