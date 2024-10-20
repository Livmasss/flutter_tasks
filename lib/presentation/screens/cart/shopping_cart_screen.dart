import 'package:flutter/material.dart';

import '../../../res/dimens.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: spacingLarge),
        Text(
          "Корзина",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
