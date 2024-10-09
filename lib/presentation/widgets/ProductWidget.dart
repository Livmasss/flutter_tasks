import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/models/ProductModel.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductWidget({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState(
      product: product,
      onTap: onTap
  );
}

class _ProductWidgetState extends State<ProductWidget> {
  final ProductModel product;
  final VoidCallback onTap;

  _ProductWidgetState({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    product.imageUri,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        product.isFavorite = !product.isFavorite;
                      });
                    },
                      icon: Icon(product.getFavoriteIconData())
                  ),
                ],
              ),
              Text("${product.cost}₽"),
              Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(product.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
