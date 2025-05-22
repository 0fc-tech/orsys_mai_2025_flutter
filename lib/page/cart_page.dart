import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);
          final cartNotifier = ref.watch(cartProvider.notifier);
          if (cart.isEmpty) {
            return Stack(
              children: [
                LineTotalPrice("0€"),
                Center(child: EmptyCart()),
              ],
            );
          } else {
            return Column(
              children: [
                LineTotalPrice(cartNotifier.getPriceTotalEur()),
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(cart[index].title),
                      trailing: IconButton(
                        onPressed: () {
                          cartNotifier.removeProduct(cart[index]);
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class LineTotalPrice extends StatelessWidget {
  const LineTotalPrice(this.totalPrice, {super.key});
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Votre panier total est de:'),
          Text('$totalPrice', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Votre panier est vide"), Icon(Icons.image)],
    );
  }
}
