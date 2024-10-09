import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/models/ProductModel.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onDeleteClicked;
  final VoidCallback onInCartPressed;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onDeleteClicked,
    required this.onInCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUri),
            const SizedBox(height: 16.0),
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Text(
              "${product.cost}₽",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.subtitle,
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    onInCartPressed();
                  },
                  child: const Text("В корзину")
                ),
                OutlinedButton(
                  onPressed: () {
                    onDeleteClicked();
                    Navigator.pop(context);
                  },
                  child: const Text("Удалить")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}