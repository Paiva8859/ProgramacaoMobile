import 'package:flutter/material.dart';
import 'package:app_lista1/ComprasModel.dart';

class ComprasController extends ChangeNotifier {
  List<ItemCompra> _itens = [];

  List<ItemCompra> get itens => _itens;

  void adicionarItem(String nome) {
    _itens.add(ItemCompra(nome, false));
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
}
