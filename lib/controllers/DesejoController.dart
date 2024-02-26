import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakestore/services/DesejoService.dart';
import 'package:fakestore/models/Desejo.dart';
import 'package:fakestore/models/Produto.dart';

final desejoControllerProvider = StateNotifierProvider<DesejoController, List<Desejo>>((ref) {
  final desejoService = ref.watch(desejoServiceProvider);
  return DesejoController(desejoService);
});

class DesejoController extends StateNotifier<List<Desejo>> {
  final DesejoService _desejoService;

  DesejoController(this._desejoService) : super([]);

  bool isOnWishlist(Produto produto) {
    return _desejoService.isOnWishlist(produto);
  }

  void addToWishlist(Produto produto) {
    final desejo = Desejo(produto: produto);
    _desejoService.adicionarDesejo(desejo);
    state = [..._desejoService.listaDesejos];
  }

  void removeFromWishlist(Produto produto) {
    final desejo = state.firstWhere((desejo) => desejo.produto == produto);
    _desejoService.removerDesejo(desejo);
    state = [..._desejoService.listaDesejos];
  }
}