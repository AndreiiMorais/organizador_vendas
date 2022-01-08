import 'package:flutter/material.dart';

customCreditsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const SimpleDialog(
        title: Text('Créditos'),
        children: [
          Center(
            child: Text('Desenvolvimento: \n Andrei Morais'),
          ),
        ],
      );
    },
  );
}
