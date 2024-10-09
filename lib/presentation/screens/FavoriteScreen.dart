import 'package:flutter/material.dart';
import 'package:flutter_task3/data/ProductsData.dart';
import 'package:flutter_task3/presentation/screens/product/ProductDetailsScreen.dart';

import '../widgets/ProductWidget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var products = [];

  @override
  void initState() {
    super.initState();
    products.addAll(initialProducts.where((element) => element.isFavorite));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              var product = products[index];
              return ProductWidget(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: product),
                    ),
                  );
                  },
              );
              },
          ),
      )
    );
  }
}
