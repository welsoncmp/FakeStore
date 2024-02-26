import 'package:fakestore/controllers/ProdutoController.dart';
import 'package:fakestore/views/Produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakestore/controllers/CarrinhoController.dart';

class CarrinhoView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(carrinhoControllerProvider);
    final ProdutoController _controller = ProdutoController();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final produto = cart[index].produto!;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              final result = await _controller.exibirProduto(produto.id);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExibirProduto(result)));
            },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: ListTile(
                  leading: Image.network(produto.image),
                  title: Text(produto.title),
                  subtitle: Text('R\$ ' +
                      (produto.price.toString()),
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  trailing: IconButton(
                    icon: Image.asset("assets/icons/delete.png", width: 30),
                    onPressed: () {
                      ref.read(carrinhoControllerProvider.notifier).removeFromCart(produto);
                    },
                  ),
                ),
              ),
          )
        );
      },
    );
  }

}
