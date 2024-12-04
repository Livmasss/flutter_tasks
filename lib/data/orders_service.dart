import 'dart:convert';

import 'package:flutter_task3/data/user_service.dart';

import '../presentation/models/order_model.dart';
import 'dio_config.dart';

Future<List<OrderModel>> getOrders() async {
  var userId = getUserId();
  var result = await getHttpClient().get("/orders/$userId");

  List<OrderModel> orders = [];

  for (var order in jsonDecode(result.data)) {
    orders.add(deserializeOrder(order));
  }
  return orders;
}

OrderModel deserializeOrder(dynamic json) {
  return OrderModel(
    json['order_id'],
    json['user_id'],
   double.parse(json['total'].toString()),
    json['status'],
    json['created_at']
  );
}
