import 'package:flutter/material.dart';
import 'package:flutter_task3/res/dimens.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style,
  });

  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return
      Material(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(radiusMedium)),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).colorScheme.primary,
        child: MaterialButton(
          onPressed: onPressed,
            minWidth: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Text(
              text,
              style: style?.copyWith(
                  color: Theme.of(context).colorScheme.background
              )
          ),
        )
      );
  }
}
