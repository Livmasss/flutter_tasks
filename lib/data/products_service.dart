import 'dart:convert';

import 'dio_config.dart';

import 'package:flutter_task3/presentation/models/ProductModel.dart';


Future<List<ProductModel>> getProducts() async {
  if (sharedProducts.isNotEmpty) {
    return sharedProducts;
  }

  var response = await getHttpClient().get(
    "/products"
  );
  var products = jsonDecode(response.data);
  List<ProductModel> list = [];

  for (var product in products) {
    var deserialized = deserializeProduct(product);
    list.add(deserialized);
  }

  sharedProducts = list;
  return list;
}

void createProduct(ProductModel product) async {
  await getHttpClient().post(
    "/products",
    data: serializeProduct(product)
  );
}

void updateProduct(ProductModel product) async {
  await getHttpClient().put(
      "/products/${product.id}",
      data: serializeProduct(product)
  );
}

void deleteProduct(int id) async {
  await getHttpClient().delete(
      "/products/$id"
  );
}

ProductModel deserializeProduct(dynamic productJson) {
  return ProductModel(
      productJson['product_id'],
      productJson['name'],
      productJson['description'],
      productJson['image_url'],
      double.parse(productJson['price'].toString()),
      false
  );
}

dynamic serializeProduct(ProductModel product) {
  return {
    'product_id': null,
    'name': product.title,
    'description': product.subtitle,
    'imageURL': product.imageUri,
    'price': product.price
  };
}

List<ProductModel> sharedProducts = [];
