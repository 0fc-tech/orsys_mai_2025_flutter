import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../model/product.dart';
import '../repository/product_repository.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Product> lsProducts = [
    Product(
      id: 1,
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      category: 'Shirts',
    ),
    Product(
      id: 2,
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      category: 'Trousers',
    ),
    Product(
      id: 3,
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      category: 'Scarves',
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 4,
      title: 'A Pan',
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
            icon: Badge(
              label: Text("${context.watch<Cart>().lsProducts.length}"),
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
              context.read<Cart>().addProduct(product);
            },
            child: Text("Ajouter"),
          ),
        );
      },
    );
  }
}
