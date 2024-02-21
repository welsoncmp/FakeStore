import 'package:flutter/material.dart';
import 'package:fakestore/views/Carrinho.dart';
import 'package:fakestore/views/Conta.dart';
import 'package:fakestore/views/Produtos.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _paginaAtual = 0;
  final List _telas = [
    Conta(),
    Produtos(),
    Carrinho(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Title(
              color: Colors.grey,
              child: Text("FakeStore")),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.search)
            )
          ],
          backgroundColor: Colors.indigo
      ),
      body: _telas[_paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _paginaAtual,
          onTap: (index){
            setState(() {
              _paginaAtual = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Conta'),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp), label: 'Carrinho'),
          ]
      ),
    );
  }
}