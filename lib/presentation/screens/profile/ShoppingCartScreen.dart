import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:flutter_task3/presentation/widgets/ShopCartItem.dart';

import '../../../data/ShoppingCartData.dart';
import '../../models/ProductModel.dart';
import '../cart/BottomBar.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List items = [];

  @override
  void initState() {
    super.initState();
    items.addAll(initialShoppingCart);
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
                return ShopCartItem(
                  product: item,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ShoppingCartBottomBar(
              totalPrice: sumPrices(),
              totalCount: getCartListLength(),
            ),
          ),
        ],
      )
    );
  }

  int getCartListLength() {
    if (items.length != null) {
      return items.length;
    } else {
      return 0;
    }
  }

  double sumPrices() {
    double sum = 0;

    for (int i = 0; i < items.length; i++) {
      sum += items[i].cost;
    }
    return sum;
  }
}
