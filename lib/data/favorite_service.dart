import 'dart:convert';

import 'package:flutter_task3/data/UserService.dart';
import 'package:flutter_task3/data/products_service.dart';
import 'package:flutter_task3/presentation/models/ProductModel.dart';

import 'dio_config.dart';

Future<List<ProductModel>> getFavorites() async {
  var userId = getUserId();
  var response = await getHttpClient().get(
      "/favorites/$userId"
  );

  var favorites = jsonDecode(response.data);
  List<ProductModel> list = [];
  for (var productJson in favorites) {
    list.add(deserializeProduct(productJson));
  }

  return list;
}