import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier'),
      ),
      body: Stack(children: [LineTotalPrice(124), Center(child: EmptyCart())]),
    );
  }
}

class LineTotalPrice extends StatelessWidget {
  const LineTotalPrice(this.totalPrice, {super.key});
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Votre panier total est de:'),
          Text('$totalPrice€', style: Theme.of(context).textTheme.titleMedium),
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
