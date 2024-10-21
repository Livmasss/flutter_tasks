import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task3/presentation/screens/cart/models/cart_item_model.dart';
import 'package:flutter_task3/res/dimens.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.model
  });

  final CartItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingSmall),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: const BorderRadius.all(radiusMedium)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  model.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SvgPicture.asset(
                "lib/assets/icons/delete.svg",
                  height: 20, width: 20,
                  fit: BoxFit.scaleDown
              )
            ],
          ),

          const SizedBox(height: 34,),

          Row(
            children: [
              Text("${model.price} ₽"),
              const Spacer(),
              
              Text("${model.patientsNumber} пациент"),
              const SizedBox(width: spacingSmall),

              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Container(
                    width: 64,
                    height: 32,
                    color: const Color(0xFFF5F5F9),
                    // child: const Placeholder()
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
