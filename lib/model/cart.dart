import 'package:flutter/foundation.dart';
import 'package:flutter_shop/model/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _lsProducts = [];

  List<Product> get lsProducts => _lsProducts;

  void addProduct(Product product) {
    _lsProducts.add(product);
    notifyListeners();
  }
}
