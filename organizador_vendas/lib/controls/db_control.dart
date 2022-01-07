import 'package:flutter/cupertino.dart';
import 'package:organizador_vendas/models/list_model.dart';
import 'package:organizador_vendas/repositories/sales_repository.dart';

class DbControl {
  final SalesReposiroty _db = SalesReposiroty();

  void insertSale(
      String name, String address, String quant, String? obs) async {
    SalesModel obj = SalesModel(name, address, quant, obs);

    int? resultado = await _db.insert(obj);

    if (resultado != null) {
      print('adicionado com sucesso');
    } else {
      print('erro ao adicionar');
    }
  }

  getSales() async {
    List salesGetted = await _db.getSales();
    List<SalesModel> tempList = <SalesModel>[];

    for (var item in salesGetted) {
      SalesModel c = SalesModel.fromMap(item);
      tempList.add(c);
    }
    List<SalesModel> sales = tempList;
    tempList = [];
    return sales;
  }

  void saleDelete(int id) async {
    await _db.deleteSale(id);
    getSales();
  }
}
