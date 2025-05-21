import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Product> lsProducts = [
    Product(
      id: 1,
      name: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      category: 'Shirts',
    ),
    Product(
      id: 2,
      name: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      category: 'Trousers',
    ),
    Product(
      id: 3,
      name: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      category: 'Scarves',
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 4,
      name: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49,
      category: 'Pan',
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Shop'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: lsProducts.length,
        itemBuilder: (context, index) {
          //Ici afficher un élément de liste ListTile
          final product = lsProducts[index];
          return ListTile(
            onTap: () {
              context.go('/detail/${product.id}');
            },
            title: Text(product.name),
            subtitle: Text(
              "${product.displayPrice()}€",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: Image.network(product.image, width: 50),
            trailing: TextButton(onPressed: () {}, child: Text("Ajouter")),
          );
        },
      ),
    );
  }
}
