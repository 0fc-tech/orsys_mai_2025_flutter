import 'dart:convert';

import 'package:flutter_shop/model/product.dart';
import 'package:http/http.dart';

class ProductRepository {
  static Future<List<Product>> getProducts() async {
    //Requête à l'API pour récupérer les produits
    final response = await get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      //Récupérer une liste de produits JSON
      final listProductsJson = jsonDecode(response.body) as List;
      return listProductsJson.map((e) => Product.fromMap(e)).toList();
    }
    return Future.error("Erreur lors de la récupération");
    //Désérialiser en liste de produits Dart
  }
}
