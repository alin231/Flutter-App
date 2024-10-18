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
    // 定義資料庫的路徑
    String path = join(await getDatabasesPath(), 'example.db');

    // 打開資料庫並創建表格
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // 創建表格
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,  // 自動遞增的主鍵
        name TEXT,                             // 名稱字段
        description TEXT                      // 描述字段
      )
    ''');
  }

  // 插入資料到表格中
  Future<int> insertItem(Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert('items', data);  // 插入資料並返回生成的 ID
  }

  // 獲取所有資料
  Future<List<Map<String, dynamic>>> getItems() async {
    Database db = await database;
    return await db.query('items');  // 查詢表中的所有資料
  }

  // 更新資料
  Future<int> updateItem(int id, Map<String, dynamic> data) async {
    Database db = await database;
    return await db.update('items', data, where: 'id = ?', whereArgs: [id]);  // 根據 ID 更新資料
  }

  // 刪除資料
  Future<int> deleteItem(int id) async {
    Database db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);  // 根據 ID 刪除資料
  }
}
