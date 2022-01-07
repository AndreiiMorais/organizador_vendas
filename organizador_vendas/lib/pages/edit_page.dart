import 'package:flutter/material.dart';
import 'package:organizador_vendas/models/list_model.dart';

class EditPage extends StatelessWidget {
  SalesModel model = SalesModel('', '', '', '');
  EditPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context)!.settings.arguments as SalesModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: ,
    );
  }
}
