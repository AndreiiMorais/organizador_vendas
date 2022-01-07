// ignore_for_file: prefer_conditional_assignment

import 'dart:io';

import 'package:organizador_vendas/models/list_model.dart';
import 'package:path_provider/path_provider.dart';
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

  //singleton
  static SalesReposiroty? _dataBaseHelper;
  static Database? _database;

  SalesReposiroty._createInstance();

  factory SalesReposiroty() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = SalesReposiroty._createInstance();
    }

    return _dataBaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializaBanco();
    }
    return _database!;
  }

  Future<Database> inicializaBanco() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String caminho = directory.path + 'sales.bd';

    var bancodeDados =
        await openDatabase(caminho, version: 1, onCreate: _criaBanco);
    return bancodeDados;
  }

  //CRUD
  Future<int?> insert(SalesModel obj) async {
    try {
      Database db = await database;
      var result = await db.insert(
        tableName,
        obj.toMap(),
      );
      return result;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  getSales() async {
    try {
      Database db = await database;
      String sql = "SELECT * FROM $tableName";

      List listSales = await db.rawQuery(sql);
      return listSales;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<int?> updateSales(SalesModel obj) async {
    try {
      Database db = await database;
      return await db.update(
        tableName,
        obj.toMap(),
        where: "id = ?",
        whereArgs: [obj.id],
      );
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<int?> deleteSale(int id) async {
    try {
      Database db = await database;
      var result = await db.delete(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return result;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
