import 'package:flutter/material.dart';

import '../../models/order_model.dart';
import 'order_details_screen.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;
  
  const OrderItemWidget({
    super.key,
    required this.order
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return OrderDetailsScreen(order: order);
        }));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Заказ номер: ${order.id}"),
                    const SizedBox(height: 4),
                    Text("На сумму ${order.total} \$"),
                  ]
              ),
              const Spacer(),
              Text("Статус:\n${order.status}")
            ],
          )
      ),
    );
  }
}
