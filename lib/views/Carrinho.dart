import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakestore/models/Produto.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Produto>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Produto>> {
  CartNotifier() : super([]);

  void addToCart(Produto produto) {
    state = [...state, produto];
  }

  void removeFromCart(Produto produto) {
    state = state.where((item) => item != produto).toList();
  }
}

class Carrinho extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(cart[index].image),
              title: Text(cart[index].title),
              subtitle: Text('R\$ ' + (cart[index].price.toString())),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  ref.read(cartProvider.notifier).removeFromCart(cart[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
