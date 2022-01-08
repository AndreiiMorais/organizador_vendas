import 'package:flutter/material.dart';
import 'package:organizador_vendas/controls/db_control.dart';

customConfirmDialog(BuildContext context, int? id) {
  DbControl _db = DbControl();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir'),
          content: const Text('Você tem Certeza?'),
          actions: [
            TextButton(
              onPressed: () {
                if (id != null) {
                  _db.saleDelete(id);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home',
                    ModalRoute.withName('/home'),
                  );
                } else {
                  _db.deleteAll();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home',
                    ModalRoute.withName('/home'),
                  );
                }
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
