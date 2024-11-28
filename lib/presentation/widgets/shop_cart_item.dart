import 'package:flutter/material.dart';
import 'package:flutter_task3/data/cart_service.dart';

import '../models/shop_cart_item_model.dart';
import '../screens/cart/cart_item_count_controller.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class ShopCartItem extends StatelessWidget {
  final ShopCartItemModel item;
  final VoidCallback onTap;
  final ValueChanged<int> onCountChanged;
  final VoidCallback deleteItem;

  const ShopCartItem({
    super.key,
    required this.item,
    required this.onTap,
    required this.onCountChanged,
    required this.deleteItem
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Slidable(

          direction: Axis.horizontal,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.5,
            children: [
              SlidableAction(
                onPressed: (context) {
                  deleteItem();
                  deleteCartItem(item);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Удалить',
              ),
            ],
          ),

          key: ValueKey(item.id.toString()),
          child: ListTile(
            leading: Image.network(
              item.imageUri,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            title: Text(item.title),
            subtitle: Text("${item.cost} \$"),
            trailing: CartItemCountChanger(
              count: item.count,
              onIncreasePressed: () {
                onCountChanged(item.count + 1);
                if (item.id != null) {
                  increaseCartItemCount(item.id!);
                }
              },
              onDecreasePressed: () {
                if (item.count == 1) {
                  deleteItem();
                  deleteCartItem(item);
                }
                else {
                  onCountChanged(item.count - 1);
                  if (item.id != null) {
                    decreaseCartItemCount(item.id!);
                  }
                }
              },
            ),
            onTap: onTap,
          )
      ),
    );
  }
}
