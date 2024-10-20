import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/cart/models/cart_item_model.dart';
import 'package:flutter_task3/res/dimens.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.model
  });

  final CartItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(radiusMedium)
      ),
      child: const Text('My Awesome Border'),
    );
  }
}
