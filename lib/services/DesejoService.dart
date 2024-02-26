import 'package:fakestore/models/Produto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakestore/models/Desejo.dart';

final desejoServiceProvider = Provider<DesejoService>((ref) => DesejoService());

class DesejoService {
  List<Desejo> _listaDesejos = [];

  List<Desejo> get listaDesejos => _listaDesejos;

  void adicionarDesejo(Desejo desejo) {
    _listaDesejos.add(desejo);
  }

  void removerDesejo(Desejo desejo) {
    _listaDesejos.remove(desejo);
  }

  bool isOnWishlist(Produto produto) {
    return _listaDesejos.any((desejo) => desejo.produto.id == produto.id);
  }
}