import 'package:fakestore/models/Produto.dart';
import 'package:fakestore/services/ProdutoService.dart';

class ProdutoController{
  final ProdutoService _service = ProdutoService();

  Future<List<Produto>> listaProdutos() async{
    return _service.listaProdutos();
  }


  Future<Produto> exibirProduto(int idProduto) async {
    try {
      final produto = await _service.exibirProduto(idProduto);
      return produto;
    } catch (e) {
      throw Exception('Erro $e');
    }
  }
}