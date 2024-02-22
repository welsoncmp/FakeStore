import 'package:fakestore/views/Carrinho.dart';
import 'package:fakestore/views/ListaDesejos.dart';
import 'package:flutter/material.dart';
import 'package:fakestore/views/Conta.dart';
import 'package:fakestore/views/Produtos.dart';
import 'CarouselSlider.dart' as Carousel;


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _paginaAtual = 1;
  final List _telas = [
    Conta(),
    Produtos(),
    CarrinhoView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white70,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        ),
        child: Column(
          children: [
            Expanded(child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/icons/man.png'),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                ),
                ListTile(leading: Icon(Icons.account_circle), title: Text('Conta'),onTap: (){setState(() {
                  _paginaAtual = 0;
                }); Navigator.pop(context); },),
                ListTile(leading: Icon(Icons.home_filled), title: Text('Inicio'),onTap: (){setState(() {
                  _paginaAtual = 1;
                }); Navigator.pop(context); }),
                ListTile(leading: Icon(Icons.shopping_cart_rounded), title: Text('Carrinho'),onTap: (){setState(() {
                  _paginaAtual = 2;
                }); Navigator.pop(context); }),
                ListTile(
                    leading: Image.asset('assets/icons/heart.png', color: Colors.black54, width: 25,),
                    title: Text('Lista de Desejos'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListaDesejos()));
                    })
              ],
            ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('www.marketsapp.com.br', style: TextStyle(color: Colors.black54),),
              ),
            )
          ],
        )
      ),

        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/icons/menu.png", width: 30,), // Mude a cor aqui
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Title(
              color: Colors.grey,
              child: const Text("FakeStore", style: TextStyle(color: Colors.white),)),
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search, color: Colors.white,)
            )
          ],
          backgroundColor: Colors.redAccent
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Carousel.CarouselWidget(
              imagens: [
                'assets/images/banner01.png',
                'assets/images/banner02.png',
                'assets/images/banner03.png'
              ],
              icone: [],
              texto: [],
            ),
            _telas[_paginaAtual],
          ],
        ),
      ),

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





