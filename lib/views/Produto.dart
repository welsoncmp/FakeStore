import 'package:fakestore/controllers/CarrinhoController.dart';
import 'package:fakestore/views/showSnackBar.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Defina a cor aqui
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.redAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("FakeStore", style: TextStyle(color: Colors.white),),
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
                      Row(
                        children: [
                          Image.asset('assets/icons/brazilian-real-moeda.png', width: 30,),
                          Text('${widget.result.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),),
                        ],
                      ),

                      Consumer(builder: (context, ref, child) {
                        return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            bool isOncart = ref.watch(carrinhoControllerProvider.notifier).isOnCart(widget.result);
                            print(isOncart);
                            return IconButton(
                              onPressed: () {
                                if(!isOncart){
                                  ref.read(carrinhoControllerProvider.notifier).addToCart(widget.result);
                                  showSnackBar(context, 'Adicionado ao carrinho');
                                }else{
                                  showSnackBar(context, 'Já existe no carrinho');
                                }
                                setState(() {});
                              },
                              icon: Image.asset('assets/icons/cart.png', width: 25,),
                            );
                          },);
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
