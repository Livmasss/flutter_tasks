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

ProductModel deserializeProduct(dynamic productJson) {
  return ProductModel(
      productJson['ID'],
      productJson['Name'],
      productJson['Description'],
      productJson['ImageURL'],
      double.parse(productJson['Price'].toString()),
      false
  );
}

// ProductModel serialize(dynamic productJson) {
//   return ProductModel(
//       productJson['ID'],
//       productJson['Name'],
//       productJson['Description'],
//       productJson['ImageURL'],
//       double.parse(productJson['Price'].toString()),
//       false
//   );
// }

List<ProductModel> sharedProducts = [];
