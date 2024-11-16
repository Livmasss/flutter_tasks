import 'dart:convert';

import 'package:flutter_task3/data/UserService.dart';

import '../presentation/models/ShopCartItemModel.dart';
import 'dio_config.dart';

List<ShopCartItemModel> initialShoppingCartData = [];

Future<List<ShopCartItemModel>> getCart() async {
  var userId = getUserId();

  var response = await getHttpClient().get(
      "/cart/$userId"
  );

  var cartItems = jsonDecode(response.data);
  List<ShopCartItemModel> list = [];

  for (var cartItem in cartItems) {
    var deserialized = deserializeProduct(cartItem);
    list.add(deserialized);
  }

  return list;
}

ShopCartItemModel deserializeProduct(dynamic productJson) {
  return ShopCartItemModel(
      productJson['product_id'],
      productJson['name'],
      productJson['description'],
      productJson['image_url'],
      double.parse(productJson['price'].toString()),
      productJson['quantity']
  );
}

dynamic serializeProduct(ShopCartItemModel product) {
  return {
    'product_id': null,
    'name': product.title,
    'description': product.subtitle,
    'imageURL': product.imageUri,
    'price': product.cost,
    'quantity': product.count
  };
}
