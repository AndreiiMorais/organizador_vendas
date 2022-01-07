import 'dart:js';

import 'package:flutter/material.dart';
import 'package:organizador_vendas/controls/db_control.dart';

customConfirmDialog(BuildContext context, int id) {
  DbControl _db = DbControl();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text('Excluir'),
          content: const Text('Você tem Certeza?'),
          actions: [
            TextButton(
              onPressed: () {
                _db.saleDelete(id);
              },
              child: const Text('Excluir'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            )
          ],
        );
      });
}
