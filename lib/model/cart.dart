import 'package:flutter_shop/model/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<Product> build() => [];

  void addProduct(Product product) {
    state = [product, ...state];
  }

  void removeProduct(Product product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void removeAllProducts() {
    state = [];
  }

  String getPriceTotalEur() =>
      "${state.fold(0.0, (prev, value) => prev + value.price).toStringAsFixed(2)}€";
}
