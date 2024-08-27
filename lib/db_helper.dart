import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'card_model.dart';




class DbHelper{

  static Database? _db ;

  Future<Database?> get db async {
    if (_db != null ){
      return _db;
    }

    _db = await initDatabase ();
    return _db;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath() + 'cart.db';
    return openDatabase(
      path,
      version: 2, // Increase this version number
      onCreate: _oncreate,
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          db.execute('ALTER TABLE cart ADD COLUMN unitTags TEXT');
        }
      },
    );
  }

  //
  // initDatabase() async {
  //   io.Directory documentDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentDirectory.path , 'cart.db');
  //   var db = await openDatabase(path, version: 1, onCreate:_oncreate );
  //   return db;
  // }
  Future<void> _oncreate(Database db , int version  ) async{
   await db.execute('CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER, productPrice INTEGER, quantity INTEGER, unitTags TEXT, images TEXT)');
   print('cart table created.');

  }
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) { // Increment this version number as needed
      await db.execute('ALTER TABLE cart ADD COLUMN images TEXT');

    }
  }




  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;

    try {
      await dbClient!.insert('cart', cart.toMap());
      print("product is added to cart");
    } catch (e) {
      print("Error inserting item: $e");
      // Handle the error, like assigning a new ID or updating the existing item
    }

    return cart;
  }

  Future<List<Cart>> getCartList() async{
    var dbClient = await db;
   final List<Map<String,Object?>>  queryResult = await dbClient!.query('cart');
  return queryResult.map((e) => Cart.fromMap(e)).toList();

  }

  Future<void> deleteItem(int id) async {
    var dbClient = await db;
    int result = await dbClient!.rawDelete('DELETE FROM cart WHERE id = ?', [id]);
    print('Delete result: $result');
  }





  Future<void> printCartTableStructureAndContents() async {
    var dbClient = await db;

    // Print the structure of the cart table
    List<Map<String, dynamic>> tableInfo = await dbClient!.rawQuery('PRAGMA table_info(cart)');
    print('Structure of cart table:');
    for (var column in tableInfo) {
      print('Column name: ${column['name']} | Type: ${column['type']} | Not Null: ${column['notnull']} | Primary Key: ${column['pk']}');
    }

    // Print the contents of the cart table
    List<Map<String, dynamic>> tableContents = await dbClient.rawQuery('SELECT * FROM cart');
    print('\nContents of cart table:');
    for (var row in tableContents) {
      print(row);
    }
  }





// Future<void> dropCartTable() async {
//   var dbClient = await db;
//   await dbClient!.execute('DROP TABLE IF EXISTS cart');
//   print('cart table dropped.');
// }
}