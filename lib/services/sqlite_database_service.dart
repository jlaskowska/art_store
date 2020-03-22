import 'dart:io';

import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/services/i_database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLiteDatabaseService implements IDatabaseService {
  sql.Database _database;

  @override
  Future<void> initialize() async {
    const databaseFilename = 'products.db';

    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, databaseFilename);

    // if db does not exist in user's documents dir, then copy from assets
    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load('assets/$databaseFilename');
      _writeToFile(data, dbPath);
    }

    // open the database
    _database = await sql.openDatabase(dbPath);
    assert(_database != null);
  }

  // taken from https://stackoverflow.com/a/50121777
  void _writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytesSync(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  @override
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];

    try {
      final List<Map> results = await _database.rawQuery('SELECT * from Products');

      for (Map map in results) {
        Product product = Product.fromJson(map);
        products.add(product);
      }
    } catch (e) {
      print(e);
    }

    return products;
  }

  @override
  Future<List<Product>> getNewestProducts() async {
    List<Product> newestProducts = [];

    try {
      final List<Map> results = await _database.rawQuery('SELECT * from Products ORDER BY RANDOM() LIMIT 5');

      for (Map map in results) {
        Product product = Product.fromJson(map);
        newestProducts.add(product);
      }
    } catch (e) {
      print(e);
    }

    return newestProducts;
  }
}
