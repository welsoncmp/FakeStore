import 'package:fakestore/models/Carrinho.dart';
import 'package:fakestore/models/Produto.dart';
import 'package:fakestore/services/CarrinhoService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carrinhoControllerProvider = StateNotifierProvider<CarrinhoController, List<Carrinho>>((ref) {
  final carrinhoService = ref.watch(carrinhoServiceProvider);
  return CarrinhoController(carrinhoService);
});

class CarrinhoController extends StateNotifier<List<Carrinho>> {
  final CarrinhoService _carrinhoService;

  CarrinhoController(this._carrinhoService) : super([]);

  bool isOnCart(Produto produto){
    return _carrinhoService.isOnCart(produto);
  }

  void addToCart(Produto produto) {
    final item = Carrinho(produto: produto);
    _carrinhoService.adicionarProduto(item);
    state = [..._carrinhoService.listaProdutos];
  }

  void removeFromCart(Produto produto) {
    final item = state.firstWhere((item) => item.produto == produto);
    _carrinhoService.removerProduto(item);
    state = [..._carrinhoService.listaProdutos];
  }
}
