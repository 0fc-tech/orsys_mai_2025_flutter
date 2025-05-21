import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'model/cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: MyApp(),
    ),
  );
}
