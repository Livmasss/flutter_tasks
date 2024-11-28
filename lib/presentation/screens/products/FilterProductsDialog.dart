import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/widgets/MyNumericFieldWidget.dart';

Future<Map<String, double>> filterProductsDialogBuilder(
    BuildContext context, {
      required double minPrice,
      required double maxPrice
    }) async {

  return await showDialog<Map<String, double>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Выберете фильтры'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyNumericFieldWidget(
              initialValue: minPrice,
              onChanged: (value) => minPrice = double.parse(value),
              hintText: "Минимальная цена"
            ),
            const SizedBox(height: 8,),
            MyNumericFieldWidget(
                initialValue: maxPrice,
                onChanged: (value) => maxPrice = double.parse(value),
                hintText: "Максимальная цена"
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Отменить'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Подтвердить'),
            onPressed: () {
              Navigator.pop(context, {
                "minPrice": minPrice,
                "maxPrice": maxPrice,
              });
            },
          ),
        ],
      );
    },
  ) ?? <String, double>{};
}
