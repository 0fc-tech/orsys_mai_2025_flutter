import 'package:flutter/material.dart';
import 'package:flutter_shop/repository/product_repository.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../model/product.dart';

class DetailProductPage extends StatefulWidget {
  final int productId;
  const DetailProductPage({super.key, required this.productId});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  Product? product;
  @override
  void initState() {
    super.initState();
    ProductRepository.getProductById(widget.productId).then((product) {
      setState(() {
        this.product = product;
      });
    }); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Détail de ${product?.title ?? "..."}'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product?.image ?? "",
                    width: double.infinity,
                    height: 280,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      width: double.infinity,
                      height: 240,
                      child: Icon(Icons.broken_image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            product?.title ?? "...",
                            style: Theme.of(context).textTheme.headlineMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${product?.displayPrice() ?? "..."}€",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product?.description ??
                          "Description du produit en cours de chargement...",
                      maxLines: 8,
                    ),
                  ),
                  //Expanded(child: WebView(initialUrl: product?.link ?? "")),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FilledButton(
                    onPressed: product == null
                        ? null
                        : () {
                            context.read<Cart>().addProduct(product!);
                          },
                    child: Text("Ajouter au panier"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
