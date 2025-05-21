import 'package:flutter/material.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Détail de iPhone 16 Pro Max'),
      ),
      body: SafeArea(
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://fr.shopping.rakuten.com/photo/apple-iphone-16-pro-titane-noir-128-go-22060889730_L_NOPAD.jpg",
              height: 300,
            ),
            Text(
              "iPhone 16 Pro Max",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              " lorem i lorem ipsu lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem",
              maxLines: 8,
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FilledButton(
                  onPressed: () {},
                  child: Text("Ajouter au panier"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
