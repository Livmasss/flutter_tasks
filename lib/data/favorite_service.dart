import 'dart:convert';

import 'package:flutter_task3/data/user_service.dart';
import 'package:flutter_task3/data/products_service.dart';
import 'package:flutter_task3/presentation/models/product_model.dart';

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

void unlikeProduct(int productId) async {
  var userId = getUserId();
  await getHttpClient().delete(
      "/favorites/$userId/$productId"
  );
}

void likeProduct(int productId) async {
  var userId = getUserId();
  await getHttpClient().post(
      "/favorites/$userId",
    data: {
      'product_id': productId
    }
  );
}
