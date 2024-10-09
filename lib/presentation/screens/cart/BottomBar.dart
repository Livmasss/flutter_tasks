import 'package:flutter/material.dart';

class ShoppingCartBottomBar extends StatefulWidget {
  double totalPrice;
  int totalCount;

  ShoppingCartBottomBar({
    super.key,
    required this.totalPrice,
    required this.totalCount
  });

  @override
  State<ShoppingCartBottomBar> createState() => _ShoppingCartBottomBarState(
      this.totalPrice,
      this.totalCount
  );
}

class _ShoppingCartBottomBarState extends State<ShoppingCartBottomBar> {
  double totalPrice;
  int totalCount;

  _ShoppingCartBottomBarState(
      this.totalPrice,
      this.totalCount
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("$totalCount элементов", style: const TextStyle(fontSize: 20)),
            const Spacer(),
            Text("Итого: $totalPrice", style: const TextStyle(fontSize: 20)),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            child: const Text("Купить", style: TextStyle(fontSize: 20)),
            onPressed: () {},
          )
        )
      ],
    );
  }
}
