import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizador_vendas/controls/db_control.dart';
import 'package:organizador_vendas/models/list_model.dart';

customTextEditingBox(BuildContext context, SalesModel obj, String text) {
  DbControl dbControl = DbControl();
  TextEditingController editText = TextEditingController();
  SalesModel saveObj;
  editText.text = text;

  comparar() {
    if (text == obj.name) {
      obj.name = editText.text;
    } else if (text == obj.address) {
      obj.address = editText.text;
    } else if (text == obj.quant) {
      obj.quant = editText.text;
    }
    return obj;
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: const Text('Editar'),
        content: TextField(
          autofocus: true,
          controller: editText,
        ),
        actions: [
          TextButton(
            onPressed: () {
              saveObj = comparar();
              dbControl.updateSale(saveObj);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/edit', ModalRoute.withName('/'),
                  arguments: saveObj);
            },
            child: const Text('Salvar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('cancelar'),
          )
        ],
      );
    },
  );
}
