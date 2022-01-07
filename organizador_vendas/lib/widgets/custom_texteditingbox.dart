import 'package:flutter/material.dart';

class CustomEditingBox extends StatelessWidget {
  TextEditingController control;
  int maxLength;
  bool? autoFocus = false;
  String labelText;
  bool? readOnly = false;
  CustomEditingBox({
    Key? key,
    required this.control,
    required this.maxLength,
    this.autoFocus,
    required this.labelText,
    this.readOnly
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: control,
      maxLength: maxLength,
      textCapitalization: TextCapitalization.words,
      autofocus: autoFocus!,
      readOnly: readOnly!,
      decoration: InputDecoration(
        label: Text(labelText),
      ),
    );
  }
}
