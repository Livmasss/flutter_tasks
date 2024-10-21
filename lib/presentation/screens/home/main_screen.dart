import 'package:flutter/material.dart';
import 'package:flutter_task3/res/dimens.dart';

import 'components/service_item.dart';
import 'models/service_model.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: spacingLarge),
        Text(
          "Каталог услуг",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 38),

        ServiceItem(
            model: ServiceModel(
              "ПЦР-тест на определение РНК коронавируса стандартный",
              1800,
              "2 дня"
            ),
            onAddClick: () {}
        )
      ],
    );
  }
}
