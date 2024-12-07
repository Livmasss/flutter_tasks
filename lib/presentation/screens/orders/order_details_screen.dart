import 'package:flutter/material.dart';
import 'package:flutter_task3/data/favorite_service.dart';
import 'package:flutter_task3/presentation/models/order_model.dart';
import 'package:flutter_task3/presentation/models/product_model.dart';
import 'package:flutter_task3/presentation/widgets/product_widget.dart';

import '../../../data/orders_service.dart';
import '../product/edit_product_screen.dart';
import '../product/product_details_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel order;
  const OrderDetailsScreen({
    super.key,
    required this.order
  });

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<ProductModel> items = [];

  @override
  void initState() {
    getOrderItems(widget.order).then((value) => setState(() {
      items = value;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];

                  return ProductWidget(
                    product: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: item,
                            onDeleteClicked: () {
                              setState(() {
                                items.remove(item);
                              });
                            },
                            onInCartPressed: () {},
                            onEditPressed: (onEdited) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => EditProductScreen(
                                    onProductEdited: (newProduct) {
                                      onEdited(newProduct);

                                      // setState(() {
                                      //   sharedProducts[index] = newProduct;
                                      // });
                                    },
                                    productModel: item,
                                  )
                              ));
                            },
                          ),
                        ),
                      );
                    }, onLikeClicked: () {
                      likeProduct(item.id!);
                  },
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}
