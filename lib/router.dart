import 'package:flutter/material.dart';
import 'package:flutter_shop/page/cart_page.dart';
import 'package:flutter_shop/page/detail_product_page.dart';
import 'package:flutter_shop/page/home_page.dart';
import 'package:go_router/go_router.dart';

final routerMain = GoRouter(
  errorBuilder:
      (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 32),
              Text("Page indisponible"),
              TextButton(
                onPressed: () => context.go('/'),
                child: Text("Retour"),
              ),
            ],
          ),
        ),
      ),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'detail/:productId',
          builder: (context, state) {
            final productId = state.pathParameters['productId'];
            if (productId != null && int.tryParse(productId) != null) {
              return DetailProductPage(
                productId: int.parse(state.pathParameters['productId']!),
              );
            } else {
              return Scaffold(body: Text("Page indisponible"));
            }
          },
        ),

        GoRoute(path: 'cart', builder: (context, state) => CartPage()),
      ],
    ),
  ],
);
