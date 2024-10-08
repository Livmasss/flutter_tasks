import 'package:flutter/material.dart';

class MyNumericFieldWidget extends StatefulWidget {
  const MyNumericFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText
  });

  final ValueChanged<String>? onChanged;
  final String hintText;

  @override
  State<MyNumericFieldWidget> createState() => _MyNumericFieldWidgetState(
      onChanged: onChanged,
      hintText: hintText
  );
}

class _MyNumericFieldWidgetState extends State<MyNumericFieldWidget> {
  final ValueChanged<String>? onChanged;
  final String hintText;

  _MyNumericFieldWidgetState({
    required this.onChanged,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText
        ),
      );
  }
}
