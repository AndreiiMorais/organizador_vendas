import 'package:flutter/material.dart';
import 'package:organizador_vendas/controls/db_control.dart';
import 'package:organizador_vendas/models/list_model.dart';
import 'package:organizador_vendas/widgets/custom_confirm_dialog.dart';
import 'package:organizador_vendas/widgets/custom_texteditingbox.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController controller = TextEditingController();

  SalesModel model = SalesModel('', '', '', '');

  DbControl dbControl = DbControl();

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context)!.settings.arguments as SalesModel;
    controller.text = model.obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        title: Text(
          model.name,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  customConfirmDialog(context, model.id!);
                });
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    model.name,
                    style: const TextStyle(fontSize: 23),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue.shade500,
                    ),
                    onPressed: () {
                      customTextEditingBox(context, model, model.name);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    model.address,
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue.shade600,
                    ),
                    onPressed: () {
                      customTextEditingBox(context, model, model.address);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    model.quant + ' Kg',
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue.shade600,
                    ),
                    onPressed: () {
                      customTextEditingBox(context, model, model.quant);
                    },
                  ),
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Observações',
              ),
              style: const TextStyle(fontSize: 20),
              maxLines: null,
              keyboardType: TextInputType.text,
              controller: controller,
              onSubmitted: (value) {
                model.obs = controller.text;
                dbControl.updateSale(model);
              },
            ),
          ],
        ),
      ),
    );
  }
}
