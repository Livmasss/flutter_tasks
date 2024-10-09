import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemCountChanger extends StatefulWidget {
  int count;
  final VoidCallback increaseCount;
  final VoidCallback decreaseCount;

  CartItemCountChanger({
    super.key,
    required this.count,
    required this.increaseCount,
    required this.decreaseCount,
  });

  @override
  State<CartItemCountChanger> createState() => _CartItemCountChangerState(
    this.count,
    this.increaseCount,
    this.decreaseCount,
  );
}

class _CartItemCountChangerState extends State<CartItemCountChanger> {
  int count;
  final VoidCallback increaseCount;
  final VoidCallback decreaseCount;

  _CartItemCountChangerState(
      this.count,
      this.increaseCount,
      this.decreaseCount,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                increaseCount();
                count = count + 1;
              });
            },
            icon: const Icon(Icons.plus_one)
        ),
        Container(
          height: 30,
          width: 30,
          color: Colors.white,
          child: Center(
              child: Text(count.toString(), style: const TextStyle(fontSize: 20))
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                decreaseCount();
                count = count - 1;
              });
            },
            icon: const Icon(Icons.exposure_minus_1)
        ),
      ],
    );
  }
}
