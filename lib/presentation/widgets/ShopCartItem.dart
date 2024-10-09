import 'package:flutter/material.dart';

import '../models/ProductModel.dart';

class ShopCartItem extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ShopCartItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ShopCartItem> createState() => _ShopCartItemState(
    product: product,
    onTap: onTap
  );
}

class _ShopCartItemState extends State<ShopCartItem> {
  final ProductModel product;
  final VoidCallback onTap;

  _ShopCartItemState({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Image.network(
          product.imageUri,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
        title: Text(product.title),
        subtitle: Text("${product.cost}₽"),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              product.isFavorite = !product.isFavorite;
            });
          },
          icon: Icon(product.getFavoriteIconData())
        ),
        onTap: onTap,
      )
    );
  }
}
