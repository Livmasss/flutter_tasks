import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/models/ProductModel.dart';

import '../../../data/ProductsData.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel product;
  final VoidCallback onDeleteClicked;
  final VoidCallback onInCartPressed;
  final VoidCallback onLikeClicked;
  final ValueChanged<ValueChanged<ProductModel>> onEditPressed;

  ProductDetailScreen({
    super.key,
    required this.product,
    required this.onDeleteClicked,
    required this.onInCartPressed,
    required this.onLikeClicked,
    required this.onEditPressed,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ValueChanged<ProductModel> onProductEdited = (newProduct) => setState(() {
      widget.product = newProduct;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      widget.product.imageUri,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.product.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Text(
                      "${widget.product.price} \$",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.product.subtitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                IconButton(
                    onPressed: () {
                      widget.onLikeClicked();
                    },
                    icon: Icon(widget.product.getFavoriteIconData())
                ),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
                    widget.onInCartPressed();
                  },
                  child: const Text("В корзину")
                ),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
                    widget.onDeleteClicked();
                    if (widget.product.id != null) {
                      deleteProduct(widget.product.id!);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Удалить")
                ),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                    onPressed: () {
                      widget.onEditPressed(onProductEdited);
                    },
                    child: const Text("Изм.")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}