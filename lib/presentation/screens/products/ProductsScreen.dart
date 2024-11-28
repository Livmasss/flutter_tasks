import 'package:flutter/material.dart';
import 'package:flutter_task3/data/CartService.dart';
import 'package:flutter_task3/data/products_service.dart';
import 'package:flutter_task3/presentation/screens/product/CreateProductScreen.dart';
import 'package:flutter_task3/presentation/screens/product/EditProductScreen.dart';
import 'package:flutter_task3/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:flutter_task3/presentation/screens/products/SortProductsDialog.dart';
import 'package:flutter_task3/presentation/widgets/MyTextFieldWidget.dart';
import 'package:flutter_task3/presentation/widgets/ProductWidget.dart';

import 'FilterProductsDialog.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var products = [];
  var searchQuery = "";

  @override
  void initState() {
    super.initState();
    var futureProducts = initializeProducts();
    futureProducts.then((value) => {
      setState(() {
        products.addAll(value);
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      IconButton.filled(
                          onPressed: () {
                            sortProductsDialogBuilder(context);
                          },
                          icon: const Icon(Icons.sort)
                      ),
                      Expanded(
                        child: MyTextFieldWidget(
                        initialValue: searchQuery,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                        hintText: "Поиск...",
                      ),
                    ),
                    IconButton.filled(
                        onPressed: () {
                          filterProductsDialogBuilder(context);
                        },
                        icon: const Icon(Icons.filter_alt)
                    ),
                  ],
                ),
              ),
                Expanded(
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
                                  product: products[index],
                                  onDeleteClicked: () {
                                    setState(() {
                                      products.remove(product);
                                      deleteProductFromCart(product);
                                      sharedProducts.remove(product);
                                    });
                                  }, onInCartPressed: () {
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
                          },
                        );
                      },
                    ),
                ),
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateProductScreen(
              onProductCreated: (product) {
                setState(() {
                  products.add(product!);
                });
              },
            )
          ),
        );
      },
        child: const Icon(Icons.add),
      ),
    );
  }
}
