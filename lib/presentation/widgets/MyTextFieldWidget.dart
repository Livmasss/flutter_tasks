import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
  const MyTextFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText
  });

  final ValueChanged<String>? onChanged;
  final String hintText;

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState(
    onChanged: onChanged,
    hintText: hintText
  );
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  final ValueChanged<String>? onChanged;
  final String hintText;

  _MyTextFieldWidgetState({
    required this.onChanged,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText
        ),
      );
  }
}
