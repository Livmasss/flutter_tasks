import 'dart:convert';

import 'package:flutter_task3/data/products_service.dart';
import 'package:flutter_task3/data/user_service.dart';
import 'package:flutter_task3/presentation/models/product_model.dart';
import 'package:flutter_task3/presentation/models/shop_cart_item_model.dart';

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

Future<void> createOrder(OrderModel order, List<ShopCartItemModel> items) async {
  var userId = getUserId();
  var result = await getHttpClient().post(
      "/orders/$userId",
      data: serializeOrder(order, items, userId!)
  );
}

Future<List<ProductModel>> getOrderItems(OrderModel order) async {
  final response = await getHttpClient().get(
    "/orders/$userId/${order.id}"
  );

  var products = jsonDecode(response.data);
  List<ProductModel> list = [];

  for (var product in products) {
    var deserialized = deserializeProduct(product);
    list.add(deserialized);
  }

  return list;
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

dynamic serializeOrder(OrderModel order, List<ShopCartItemModel> items, String userId) {
  final request = {
    'order_id': null,
    'user_id': userId,
    'total': order.total,
    'status': order.status,
    'created_at': null,
    'products': items
  };

  print(request);
  return request;
}

