import 'package:flutter/material.dart';

import '../../../../res/dimens.dart';
import '../models/home_menu_model.dart';

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem({
    super.key,
    required this.model,
  });

  final ProfileMenuModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mainMenuHeight,
      child: Row(
        children: [
          SizedBox(
            height: mainMenuImageSize,
            width: mainMenuImageSize,
            child: Image.asset(model.iconPath),
          ),
          const SizedBox(width: 20),
          Text(
            model.label,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
