import 'package:flutter/foundation.dart';
import 'package:flutter_shop/model/product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _lsProducts = [];

  List<Product> get lsProducts => _lsProducts;

  void addProduct(Product product) {
    _lsProducts.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _lsProducts.remove(product);
    notifyListeners();
  }

  void removeAllProducts() {
    _lsProducts.clear();
    notifyListeners();
  }

  String getPriceTotalEur() =>
      "${_lsProducts.fold(0.0, (previousValue, element) => previousValue + element.price).toStringAsFixed(2)}€";
}
