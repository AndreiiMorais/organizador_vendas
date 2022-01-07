import 'package:sqflite/sqflite.dart';

class SalesReposiroty {
  String tableName = 'tbl_sales';
  String colId = 'id';
  String colName = 'name';
  String colAddress = 'address';
  String colQuant = 'quant';
  String colObs = 'obs';

  void _criaBanco(Database db, int versao) async {
    await db.execute('CREATE TABLE $tableName ('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colName Text, '
        '$colAddress Text, '
        '$colQuant Text, '
        '$colObs Text)');
  }
}
