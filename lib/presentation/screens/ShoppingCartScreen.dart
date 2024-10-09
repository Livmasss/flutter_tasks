import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:flutter_task3/presentation/widgets/ShopCartItem.dart';

import '../../data/ShoppingCartData.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  var items = [];

  @override
  void initState() {
    super.initState();
    items.addAll(initialShoppingCart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          return ShopCartItem(
            product: item,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: item),
                ),
              );
            },
          );
        },
      )
    );
  }
}
