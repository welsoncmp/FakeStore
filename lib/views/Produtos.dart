import 'package:fakestore/controllers/ProdutoController.dart';
import 'package:fakestore/models/Produto.dart';
import 'package:fakestore/views/Carrinho.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Produto.dart';

class Produtos extends StatefulWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final ProdutoController _controller = ProdutoController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Produto>>(
      future: _controller.listaProdutos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar os dados'));
        } else {
          final produtos = snapshot.data!;
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final result = await _controller.exibirProduto(produto.id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ExibirProduto(result)));
                        },
                        child: Image.network(produto.image),
                      ),
                      ListTile(
                        title: Text(produto.title),
                        subtitle: Text('Preço: R\$ ${produto.price.toStringAsFixed(2)}'),
                        trailing: Consumer(builder: (context, ref, child) {
                          return IconButton(
                            onPressed: () {
                              ref.read(cartProvider.notifier).addToCart(produto);
                            },
                            icon: Icon(Icons.add_shopping_cart),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
