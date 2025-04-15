import 'package:flutter/material.dart';

class CarrinhoModel extends ChangeNotifier {
  final Map<String, int> _itens = {};

  Map<String, int> get itens => _itens;

  void adicionar(String nome) {
    _itens[nome] = (_itens[nome] ?? 0) + 1;
    notifyListeners();
  }

  void remover(String nome) {
    if (_itens[nome] != null && _itens[nome]! > 0) {
      _itens[nome] = _itens[nome]! - 1;
      notifyListeners();
    }
  }

  int quantidade(String nome) {
    return _itens[nome] ?? 0;
  }

  int totalItens() {
    return _itens.values.fold(0, (soma, quantidade) => soma + quantidade);
  }
}
