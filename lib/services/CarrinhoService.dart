import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakestore/models/Carrinho.dart';

final carrinhoServiceProvider = Provider<CarrinhoService>((ref) => CarrinhoService());

class CarrinhoService {
  List<Carrinho> _listaProdutos = [];

  List<Carrinho> get listaProdutos => _listaProdutos;

  void adicionarProduto(Carrinho carrinho) {
    _listaProdutos.add(carrinho);
  }

  void removerProduto(Carrinho carrinho) {
    _listaProdutos.remove(carrinho);
  }
}