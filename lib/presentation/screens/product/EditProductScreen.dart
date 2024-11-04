import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/models/ProductModel.dart';
import 'package:flutter_task3/presentation/widgets/MyNumericFieldWidget.dart';
import 'package:flutter_task3/presentation/widgets/MyTextFieldWidget.dart';

import '../../../data/ProductsData.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({
    super.key,
    required this.productModel
  });

  final ProductModel productModel;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState(
      productModel: productModel
  );
}

class _EditProductScreenState extends State<EditProductScreen> {

  // void onProductEdited() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen(
  //       productModel: productModel
  //   )));
  // }
  final ProductModel productModel;

  _EditProductScreenState({
    required this.productModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyTextFieldWidget(
              onChanged: (text) { productModel.title = text; },
              hintText: "Название"
          ),
          MyTextFieldWidget(
              onChanged: (text) { productModel.subtitle = text; },
              hintText: "Описание"
          ),
          MyNumericFieldWidget(
              onChanged: (text) {
                try {
                  productModel.price = double.parse(text);
                }
                catch(e) {
                  productModel.price = 0;
                }
              },
              hintText: "Стоимость"
          ),
          MyTextFieldWidget(
              onChanged: (text) { productModel.imageUri = text; },
              hintText: "Ссылка на изображение"
          ),

          const Spacer(),
          OutlinedButton(
              onPressed: () {
                createProduct(productModel);
                // onProductEdited();

                Navigator.pop(context);
              },
              child: const Text("Добавить")
          ),
        ],
      ),
    );
  }
}
