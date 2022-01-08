import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizador_vendas/controls/db_control.dart';

customShowAlertDialog(BuildContext context) {
  DbControl control = DbControl();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController quant = TextEditingController();
  TextEditingController obs = TextEditingController();

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Venda'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  maxLength: 50,
                  controller: name,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Insira o Nome',
                  ),
                ),
                TextField(
                  maxLength: 100,
                  controller: address,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                    hintText: 'Insira o Endereço',
                  ),
                ),
                TextField(
                  maxLength: 4,
                  controller: quant,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    hintText: 'Insira a Quantidade a Entregar',
                  ),
                ),
                TextField(
                  maxLines: 2,
                  autocorrect: true,
                  maxLength: 300,
                  controller: obs,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Observações',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                control.insertSale(
                    name.text, address.text, quant.text, obs.text);
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      });
}
