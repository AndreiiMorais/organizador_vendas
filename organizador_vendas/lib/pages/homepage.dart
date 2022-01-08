import 'package:flutter/material.dart';
import 'package:organizador_vendas/controls/db_control.dart';
import 'package:organizador_vendas/models/list_model.dart';
import 'package:organizador_vendas/widgets/custom_confirm_dialog.dart';
import 'package:organizador_vendas/widgets/custom_credits.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Entregas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _reload();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              tileColor: Colors.blue.shade900,
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Opções',
                  style:
                      TextStyle(fontSize: 30, color: Colors.lightBlue.shade100),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Limpar Lista',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                customConfirmDialog(context, null);
              },
            ),
            ListTile(
              title: const Text(
                'Creditos',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                customCreditsDialog(context);
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        initialData: widget.list,
        future: widget.control.getSale(),
        builder: (context, snapshot) {
          widget.list = snapshot.data as List<SalesModel>;
          return RefreshIndicator(
            onRefresh: _reload,
            child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      '/edit',
                      arguments: widget.list[index],
                    );
                  },
                  title: Card(
                    elevation: 10,
                    child: Text(
                      widget.list[index].name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  trailing: Text(
                    widget.list[index].quant + ' Kg',
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
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

  Future<void> _reload() async {
    var tempList = await widget.control.getSale();

    setState(() {
      widget.list = tempList;
    });
  }
}


// Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Opções:',
//                         style: TextStyle(
//                             fontSize: 30, color: Colors.lightBlue.shade100),
//                       ),
//                     ),
//                     color: Colors.blue.shade900,
//                     height: 150,
//                   ),
//                 ),
//               ],
//             ),
//             ListView(
//               children: [
//                 ListTile(
//                   title: const Text('Limpar Lista'),
//                   onTap: () {
//                     customConfirmDialog(context, null);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),