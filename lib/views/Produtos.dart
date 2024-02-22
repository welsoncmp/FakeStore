import 'package:fakestore/controllers/CarrinhoController.dart';
import 'package:fakestore/controllers/DesejoController.dart';
import 'package:fakestore/controllers/ProdutoController.dart';
import 'package:fakestore/models/Produto.dart';
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
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Número de colunas
              childAspectRatio: 0.6, // Ajuste a proporção conforme necessário
            ),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Expanded( // Adicionado para evitar estouro de tela
                        child: GestureDetector(
                          onTap: () async {
                            final result = await _controller.exibirProduto(produto.id);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExibirProduto(result)));
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.network(produto.image, fit: BoxFit.cover),
                                  Row(
                                    children: List.generate(produto.rate.toInt(), (star) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 10,
                                          left: star == 0 ? 10 : 0,
                                        ),
                                        child: GestureDetector(
                                            onTap: (){_showSnackBar('Item Avaliado');},
                                            child: Icon(Icons.star, color: Colors.yellow, size: 15,)),
                                      );
                                    }),
                                  )

                                ],
                              ),

                              Consumer(builder: (context, ref, child) {
                                return IconButton(
                                  onPressed: () {
                                    ref.read(desejoControllerProvider.notifier).addToWishlist(produto);
                                    _showSnackBar('Desejo Adicionado');
                                  },
                                  icon: Image.asset('assets/icons/heart.png', width: 25,),
                                );
                              }),
                            ],
                          )// Adicionado fit: BoxFit.cover para ajustar a imagem
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                            child: Center(child: Text(produto.title, overflow: TextOverflow.ellipsis)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:
                                Row(
                                  children: [
                                    Image.asset('assets/icons/brazilian-real-moeda.png', width: 25,),
                                    Text('${produto.price.toStringAsFixed(2)}')
                                  ],
                                ),
                              ),
                              Consumer(builder: (context, ref, child) {
                                return IconButton(
                                  onPressed: () {
                                    ref.read(carrinhoControllerProvider.notifier).addToCart(produto);
                                    _showSnackBar('Adicionado ao carrinho');
                                  },
                                  icon: Image.asset('assets/icons/cart.png', width: 25,),
                                );
                              }),
                            ],
                          ),
                        ],
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

  void _showSnackBar(String? mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            '$mensagem',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black12,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          side: BorderSide(color: Colors.white),
        ),
      ),
    );
  }






}
