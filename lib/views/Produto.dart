import 'package:fakestore/views/Carrinho.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExibirProduto extends StatefulWidget {
  final dynamic result;
  const ExibirProduto(this.result);

  @override
  State<ExibirProduto> createState() => _ExibirProdutoState();
}

class _ExibirProdutoState extends State<ExibirProduto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("FakeStore"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(widget.result.image),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(widget.result.title, style: TextStyle(fontSize: 15, color: Colors.indigo, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15, left: 30, right: 30),
                  child: Text(widget.result.description, textAlign: TextAlign.justify),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('R\$ ${widget.result.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),),

                      Consumer(builder: (context, ref, child) {
                        return IconButton(
                          onPressed: () {
                            ref.read(cartProvider.notifier).addToCart(widget.result);
                          },
                          icon: Icon(Icons.add_shopping_cart),
                        );
                      }),

                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
