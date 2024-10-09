import 'package:flutter/material.dart';

import '../models/ShopCartItemModel.dart';
import '../screens/cart/CartItemCountChanger.dart';

class ShopCartItem extends StatefulWidget {
  final ShopCartItemModel item;
  final VoidCallback onTap;
  final ValueChanged<int> onCountChanged;

  const ShopCartItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.onCountChanged
  });

  @override
  State<ShopCartItem> createState() => _ShopCartItemState(
      item: item,
      onTap: onTap,
      onCountChanged: onCountChanged
  );
}

class _ShopCartItemState extends State<ShopCartItem> {
  final ShopCartItemModel item;
  final VoidCallback onTap;
  final ValueChanged<int> onCountChanged;

  _ShopCartItemState({
    required this.item,
    required this.onTap,
    required this.onCountChanged
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Image.network(
          item.imageUri,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
        title: Text(item.title),
        subtitle: Text("${item.cost}₽"),
        trailing: CartItemCountChanger(
          count: item.count,
          increaseCount: () {
            onCountChanged(item.count + 1);
          },
          decreaseCount: () {
            onCountChanged(item.count - 1);
          },
        ),
        onTap: onTap,
      )
    );
  }
}
