import 'package:flutter/material.dart';
import 'package:organizador_vendas/models/list_model.dart';
import 'package:organizador_vendas/widgets/custom_texteditingbox.dart';

class EditPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  SalesModel model = SalesModel('', '', '', '');
  EditPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context)!.settings.arguments as SalesModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        title: Text(model.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            child: Text(
              model.name,
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () {
              customTextEditingBox(context, model, model.name);
            },
          ),
          TextButton(
            child: Text(
              model.address,
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () {
              customTextEditingBox(context, model, model.address);
            },
          ),
          TextButton(
            child: Text(
              model.quant,
              style: const TextStyle(color: Colors.black),
            ),
            onPressed: () {
              customTextEditingBox(context, model, model.quant);
            },
          ),
        ],
      ),
    );
  }
}
