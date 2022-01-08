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

  Future<List<SalesModel>> getSale() async {
    List<SalesModel> tempList = <SalesModel>[];
    List salesGetted = await _db.getSales();

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
    getSale();
  }

  void updateSale(SalesModel obj) async {
    await _db.updateSales(obj);
  }

  void deleteAll() async {
    await _db.deleteAllSales();
  }
}
