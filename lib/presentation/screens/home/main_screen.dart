import 'package:flutter/material.dart';
import 'package:flutter_task3/res/dimens.dart';

import 'components/services_list.dart';


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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: spacingLarge),
        Text(
          "Каталог услуг",
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        const SizedBox(height: 38),
        ServicesList()
      ],
    );
  }
}
