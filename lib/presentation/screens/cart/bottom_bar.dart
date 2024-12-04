import 'package:flutter/material.dart';
import 'package:flutter_task3/data/orders_service.dart';
import 'package:flutter_task3/presentation/models/order_model.dart';

class ShoppingCartBottomBar extends StatelessWidget {
  double totalPrice;
  int totalCount;

  ShoppingCartBottomBar({
    super.key,
    required this.totalPrice,
    required this.totalCount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("$totalCount элементов", style: const TextStyle(fontSize: 20)),
            const Spacer(),
            Text("Итого: $totalPrice \$", style: const TextStyle(fontSize: 20)),
          ],
        ),
        SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              child: const Text("Купить", style: TextStyle(fontSize: 20)),
              onPressed: () {
                createOrder(
                  OrderModel(0, "", totalPrice, "Pending", "")
                );
              },
            )
        )
      ],
    );
  }
}
