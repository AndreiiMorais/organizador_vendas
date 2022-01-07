import 'package:flutter/material.dart';

class CustomEditingBox extends StatelessWidget {
  TextEditingController control;
  int maxLength;
  bool? autoFocus;
  String labelText;

  CustomEditingBox({
    Key? key,
    required this.control,
    required this.maxLength,
    this.autoFocus = false,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      controller: control,
      maxLength: maxLength,
      textCapitalization: TextCapitalization.words,
      autofocus: autoFocus!,
      enabled: false,
      decoration: InputDecoration(
        label: Text(labelText),
      ),
    );
  }
}
