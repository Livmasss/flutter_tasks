import 'package:flutter/material.dart';
import 'package:flutter_task3/data/cart_service.dart';
import 'package:flutter_task3/data/products_service.dart';
import 'package:flutter_task3/presentation/models/product_model.dart';
import 'package:flutter_task3/presentation/screens/product/create_product_screen.dart';
import 'package:flutter_task3/presentation/screens/product/edit_product_screen.dart';
import 'package:flutter_task3/presentation/screens/product/product_details_screen.dart';
import 'package:flutter_task3/presentation/screens/products/sort_types.dart';
import 'package:flutter_task3/presentation/widgets/text_field_widget.dart';
import 'package:flutter_task3/presentation/widgets/product_widget.dart';

import 'filter_products_dialog.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> products = [];
  List<ProductModel> allProducts = [];
  var searchQuery = "";

  double minPrice = 0.0;
  double maxPrice = double.infinity;

  @override
  void initState() {
    super.initState();
    var futureProducts = initializeProducts();
    futureProducts.then((value) => {
      setState(() {
        products.addAll(value);
        allProducts = value;
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
                      PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.sort
                        ),
                        onSelected: (value) {
                          handleSortSelection(value);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: SortType.titleAsc.name,
                            child: const Text('Название (по возрастанию)'),
                          ),
                          PopupMenuItem<String>(
                            value: SortType.titleDesc.name,
                            child: const Text('Название (по убыванию)'),
                          ),
                          PopupMenuItem<String>(
                            value: SortType.priceAsc.name,
                            child: const Text('Цена (по возрастанию)'),
                          ),
                          PopupMenuItem<String>(
                            value: SortType.priceDesc.name,
                            child: const Text('Цена (по убыванию)'),
                          ),
                        ],
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
                    IconButton(
                        onPressed: openFilterDialog,
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
                                  increaseCartItemCount(product.id!);
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
  void openFilterDialog() async {
    final result = await filterProductsDialogBuilder(
      context,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    if (result.isNotEmpty) {
      minPrice = result["minPrice"]!;
      maxPrice = result["maxPrice"]!;

      setState(() {
        products = filterProducts(searchQuery, minPrice, maxPrice);
      });
    }
  }

  List<ProductModel> filterProducts(String query, double minPrice, double maxPrice) {
    return allProducts.where((product) {
      bool priceMatches = product.price >= minPrice && product.price <= maxPrice;
      bool searchMatches = product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.subtitle.toLowerCase().contains(query.toLowerCase());
      return priceMatches && searchMatches;
    }).toList();
  }

  void handleSortSelection(String sortTypeString) {
    setState(() {
      final sortType = SortType.values.firstWhere((element) => element.name == sortTypeString);

      switch(sortType) {
        case SortType.priceAsc:
          products.sort((a, b) => a.price.compareTo(b.price));
          break;
        case SortType.priceDesc:
          products.sort((a, b) => b.price.compareTo(a.price));
          break;
        case SortType.titleAsc:
          products.sort((a, b) => a.title.compareTo(b.title));
          break;
        case SortType.titleDesc:
          products.sort((a, b) => b.title.compareTo(a.title));
          break;
      }
    });
  }
}
