import 'package:flutter/material.dart';
import 'package:flutter_task3/data/cart_service.dart';
import 'package:flutter_task3/presentation/screens/product/edit_product_screen.dart';
import 'package:flutter_task3/presentation/screens/product/product_details_screen.dart';

import '../../data/favorite_service.dart';
import '../../data/products_service.dart';
import '../widgets/product_widget.dart';

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

    getFavorites().then((value) => setState(() {
      products = value;
    }));
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
                      builder: (context) => ProductDetailScreen(
                        product: product,
                        onDeleteClicked: () {
                          deleteProductFromCart(product);
                          setState(() {
                            products.remove(product);
                            sharedProducts.remove(product);
                          });
                      },
                        onInCartPressed: () {
                          increaseCartItemCount(product.id);
                      },
                        onEditPressed: (onEdited) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => EditProductScreen(
                                onProductEdited: (newProduct) {
                                  onEdited(newProduct);
                                  var productsFuture = getProducts();
                                  productsFuture.then((value) =>
                                      setState(() {
                                        products = value;
                                      })
                                  );
                                  setState(() {
                                    sharedProducts[index] = newProduct;
                                  });
                                },
                                productModel: product,
                              )
                          ));
                          },
                      ),
                    ),
                  );
                },
                onLikeClicked: () {
                  setState(() {
                    product.isFavorite = !product.isFavorite;
                  });
              },);},
          ),
      )
    );
  }
}