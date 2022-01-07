import 'package:flutter/cupertino.dart';
import 'package:organizador_vendas/models/list_model.dart';
import 'package:organizador_vendas/repositories/sales_repository.dart';

class DbControl {
  final SalesReposiroty _db = SalesReposiroty();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _quant = TextEditingController();
  final TextEditingController _obs = TextEditingController();

  void insertSale() async {
    SalesModel obj =
        SalesModel(_name.text, _address.text, _quant.text, _obs.text);

    int? resultado = await _db.insert(obj);

    if (resultado != null) {
      print('adicionado com sucesso');
    } else {
      print('erro ao adicionar');
    }
  }
}
