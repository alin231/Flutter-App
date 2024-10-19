import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // 單例模式確保只有一個 DatabaseHelper 實例
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  // 獲取資料庫實例，如果資料庫未初始化則初始化
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  // 初始化資料庫
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'example.db');
    print('Initializing database at: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // 創建表格
  Future _onCreate(Database db, int version) async {
    print('Creating tables...');
    await db.execute(
      'CREATE TABLE items ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT, '
      'description TEXT)'
    );
    print('Tables created.');
  }


  // 插入資料到表格中
  Future<int> insertItem(Map<String, dynamic> data) async {
    Database db = await database;
    int id = await db.insert('items', data);  // 插入資料並返回生成的 ID
    print('Inserted item: $data with id: $id');
    return id;
  }

  // 獲取所有資料
  Future<List<Map<String, dynamic>>> getItems() async {
    Database db = await database;
    List<Map<String, dynamic>> items = await db.query('items');  // 查詢表中的所有資料
    print('Fetched items: $items');
    return items;
  }

  // 更新資料
  Future<int> updateItem(int id, Map<String, dynamic> data) async {
    Database db = await database;
    int count = await db.update('items', data, where: 'id = ?', whereArgs: [id]);  // 根據 ID 更新資料
    print('Updated item with id: $id, updated count: $count');
    return count;
  }

  // 刪除資料
  Future<int> deleteItem(int id) async {
    Database db = await database;
    int count = await db.delete('items', where: 'id = ?', whereArgs: [id]);  // 根據 ID 刪除資料
    print('Deleted item with id: $id, deleted count: $count');
    return count;
  }

  // 查詢所有資料
  Future<List<Map<String, dynamic>>> queryAllItems() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query('items');
    print('Queried all items: $items');
    return items;
  }

  // 根據名稱刪除資料
  Future<int> deleteItemByName(String name) async {
    final db = await database;
    int count = await db.delete('items', where: 'name = ?', whereArgs: [name]);
    print('Deleted item with name: $name, deleted count: $count');
    return count;
  }
}
