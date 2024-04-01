/*
import 'package:path/path.dart';
import 'package:sinbal/database/product.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider._instance();

  DBProvider._instance();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var documentDirectory = await getDatabasesPath();
    String path = join(documentDirectory, 'TestDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE product ("
              " id INTEGER PRIMARY KEY,"
              " name TEXT,"
              " size INTEGER,"
              " color TEXT,"
              " price INTEGER)");
        });
  }

  //product

  Future<List<Product>> getAllProduct() async {
    final db = await database;
    var result = await db?.rawQuery("SELECT * FROM product");
    List<Product>? list = (result?.isNotEmpty ?? false)
        ? result?.map((e) => Product.fromMap(e)).toList() ?? []
        : [];
    return list;
  }

  newProduct(Product product) async {
    final db = await database;
    var query = await db?.rawQuery('SELECT MAX(id) as id FROM product');
    int id = int.parse((query?.first['id'] ?? "0").toString());
    id += 1;
    var raw = await db?.rawInsert(
        " INSERT into product(id, name, size, color, price)"
            " VALUES(?,?,?,?,?) ",
        [id ,product.name, product.size, product.color, product.price]);
    return raw;
  }
  deleteProduct(int id) async {
    final db = await database;
    return db?.delete('product', where: "id = ?", whereArgs: [id]);
  }

  everythingProduct(Product product) async {
    final db = await database;
    Product allProduct = Product(
        name: product.name,
        size: product.size,
        color: product.color,
        price: product.price
    );

    var resultProduct = await db?.update('product', allProduct.toMap(),
        where: "id = ?", whereArgs: [allProduct.id]);
  }
}
*/