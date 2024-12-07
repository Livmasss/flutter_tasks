import 'package:flutter/material.dart';
import 'package:flutter_task3/data/orders_service.dart';

import '../../models/order_model.dart';
import 'order_item_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<OrderModel> orders = [];

  @override
  void initState() {
    getOrders().then((value) => setState(() {
      orders = value;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  OrderItemWidget(order: orders[index]),
                  const Divider()
                ],
              )
            )
        )
    );
  }
}
