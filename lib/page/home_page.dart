import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../model/product.dart';
import '../repository/product_repository.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Shop'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/cart');
            },
            icon: Badge(
              label: Text("${ref.watch(cartProvider).length}"),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductRepository.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data?.isNotEmpty == true) {
            return ListViewProducts(lsProducts: snapshot.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

//TODO Transformer StatelessWidget en ConsumerWidget
class ListViewProducts extends StatelessWidget {
  const ListViewProducts({super.key, required this.lsProducts});

  final List<Product> lsProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lsProducts.length,
      itemBuilder: (context, index) {
        //Ici afficher un élément de liste ListTile
        final product = lsProducts[index];
        return ListTile(
          onTap: () {
            context.go('/detail/${product.id}');
          },
          title: Text(product.title),
          subtitle: Text(
            "${product.displayPrice()}€",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: Image.network(product.image, width: 50),
          trailing: TextButton(
            onPressed: () {
              //TODO Transformer l'appel d'ajout produit en Riverpod
              context.read<Cart>().addProduct(product);
            },
            child: Text("Ajouter"),
          ),
        );
      },
    );
  }
}
