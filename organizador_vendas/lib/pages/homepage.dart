import 'package:flutter/material.dart';
import 'package:organizador_vendas/controls/db_control.dart';
import 'package:organizador_vendas/models/list_model.dart';
import 'package:organizador_vendas/widgets/custom_sale_alertbox.dart';

class HomePage extends StatefulWidget {
  DbControl control = DbControl();
  List<SalesModel> list = <SalesModel>[];
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    widget.list = widget.control.getSales();
    return Scaffold(
      appBar: AppBar(
        title: const Text('homepage'),
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Card(
              child: Text(widget.list[index].name),
            ),
            trailing: Text(widget.list[index].quant),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customShowAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
