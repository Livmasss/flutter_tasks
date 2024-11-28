import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/models/product_model.dart';
import 'package:flutter_task3/presentation/widgets/numeric_field_widget.dart';
import 'package:flutter_task3/presentation/widgets/text_field_widget.dart';

import '../../../data/products_service.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({
    super.key,
    required this.productModel,
    required this.onProductEdited
  });

  final ValueChanged<ProductModel> onProductEdited;
  final ProductModel productModel;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState(
    onProductEdited: onProductEdited,
    productModel: productModel,
  );
}

class _EditProductScreenState extends State<EditProductScreen> {

  final ValueChanged<ProductModel> onProductEdited;
  final ProductModel productModel;

  _EditProductScreenState({
    required this.onProductEdited,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              MyTextFieldWidget(
                onChanged: (text) {productModel.title = text;},
                hintText: "Название",
                initialValue: productModel.title,
              ),
              MyTextFieldWidget(
                onChanged: (text) { productModel.subtitle = text; },
                hintText: "Описание",
                initialValue: productModel.subtitle,
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
                hintText: "Стоимость",
                initialValue: productModel.price,
              ),
              MyTextFieldWidget(
                onChanged: (text) { productModel.imageUri = text; },
                hintText: "Ссылка на изображение",
                initialValue: productModel.imageUri,
              ),

              const Spacer(),
              OutlinedButton(
                  onPressed: () {
                    updateProduct(productModel);
                    onProductEdited(productModel);

                    Navigator.pop(context);
                  },
                  child: const Text("Подтвердить")
              ),
            ],
          ),
        ),
    );
  }
}
