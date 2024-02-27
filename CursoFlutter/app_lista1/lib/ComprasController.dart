// ComprasController.dart
import 'package:flutter/material.dart';
import 'ComprasModel.dart';

class ComprasController extends ChangeNotifier {
  List<ItemCompra> _itens = [];

  List<ItemCompra> get itens => _itens;

  // Adicione este método para classificar os itens com base na opção selecionada
  void sortItems(String sortingOption) {
    switch (sortingOption) {
      case 'ordem alfabética A-Z':
        _itens.sort((a, b) => a.nome.compareTo(b.nome));
        break;
      case 'ordem alfabética Z-A':
        _itens.sort((a, b) => b.nome.compareTo(a.nome));
        break;
      case 'Preço Crescente':
        _itens.sort((a, b) => a.preco.compareTo(b.preco));
        break;
      case 'Preço Decrescente':
        _itens.sort((a, b) => b.preco.compareTo(a.preco));
        break;
      case 'Quantidade Crescente':
        _itens.sort((a, b) => a.quantidade.compareTo(b.quantidade));
        break;
      case 'Quantidade Decrescente':
        _itens.sort((a, b) => b.quantidade.compareTo(a.quantidade));
        break;
      case 'Agrupar por Categoria':
        _itens.sort((a, b) => a.categoria.compareTo(b.categoria));
        break;
      default:
        break;
    }
    notifyListeners();
  }

  void adicionarItem(String nome, int quantidade, double preco, String categoria) {
    _itens.add(ItemCompra(nome, quantidade, preco, false, categoria));
    notifyListeners();
  }

  void marcarItemComoConcluido(int index, bool value) {
    _itens[index].concluido = value;
    notifyListeners();
  }

  void removerItem(int index) {
    _itens.removeAt(index);
    notifyListeners();
  }

  void editarItem(int index, String novoNome, int novaQuantidade, double novoPreco, String novaCategoria) {
    _itens[index] = ItemCompra(novoNome, novaQuantidade, novoPreco, _itens[index].concluido, novaCategoria);
    notifyListeners();
  }
}
