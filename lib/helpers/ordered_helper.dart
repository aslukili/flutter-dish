import 'dart:async';
import 'package:flutter_dish/models/ordered.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/food.dart';
import '../models/order.dart';
import 'food_helper.dart';

class OrderedHelper {
  static final _databaseName = 'ordered_database.db';
  static final _databaseVersion = 1;

  static final table = 'ordered';
  static final columnId = 'id';
  static final columnFoodId = 'foodId';
  static final columnDate = 'date';
  static final columnQuantity = 'quantity';

  static Database? _database;
  static final OrderedHelper instance = OrderedHelper._privateConstructor();

  OrderedHelper._privateConstructor();

  static Future<OrderedHelper> create() async {
    OrderedHelper helper = OrderedHelper._privateConstructor();
    await helper._initDatabase();
    return helper;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnFoodId INTEGER NOT NULL,
        $columnDate TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL
      )
      ''');
  }

  Future<int> insert(Ordered order) async {
    Database db = await instance.database;
    return await db.insert(table, order.toMap());
  }

  Future<List<Ordered>> queryAllRows() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(table);
    List<Ordered> orders = [];
    for (Map<String, dynamic> map in maps) {
      int foodId = map[columnFoodId];
      Food? food = await FoodHelper.instance.getFood(foodId);
      orders.add(Ordered.fromMap(map, food!));
    }
    return orders;
  }
}
