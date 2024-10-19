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
    String path = join(await getDatabasesPath(), 'multi_tables.db');
    print('初始化資料庫於: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // 創建表格
  Future _onCreate(Database db, int version) async {
    print('創建表格...');

    // 創建 user_words 表
    await db.execute(
      'CREATE TABLE user_words ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'chinese_word TEXT, '  // 中文單字
      'english_word TEXT, '  // 英文單字
      'pun TEXT, '           // 諧音/雙關
      'definition TEXT)'      // 解釋
    );

    // 創建 user_data 表
    await db.execute(
      'CREATE TABLE user_data ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'username TEXT, '   // 帳號
      'password TEXT)'    // 密碼
    );

    // 創建 dailypun_result 表
    await db.execute(
      'CREATE TABLE dailypun_result ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'chinese_word TEXT, '  // 中文單字
      'english_word TEXT, '  // 英文單字
      'pun TEXT, '           // 諧音/雙關
      'definition TEXT)'      // 解釋
    );

    print('表格創建完成。');
  }

  // 插入資料到指定表格中
  Future<int> insertItem(String tableName, Map<String, dynamic> data) async {
    Database db = await database;
    int id = await db.insert(tableName, data);  // 插入資料並返回生成的 ID
    print('插入至 $tableName: $data, 生成的 ID: $id');
    return id;
  }

  // 獲取表格中所有資料
  Future<List<Map<String, dynamic>>> getItems(String tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> items = await db.query(tableName);  // 查詢表中的所有資料
    print('從 $tableName 獲取資料: $items');
    return items;
  }

  // 根據 ID 更新資料
  Future<int> updateItem(String tableName, int id, Map<String, dynamic> data) async {
    Database db = await database;
    int count = await db.update(tableName, data, where: 'id = ?', whereArgs: [id]);  // 根據 ID 更新資料
    print('更新 $tableName 中 ID 為 $id 的資料，更新數量: $count');
    return count;
  }

  // 根據 ID 刪除資料
  Future<int> deleteItem(String tableName, int id) async {
    Database db = await database;
    int count = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);  // 根據 ID 刪除資料
    print('刪除 $tableName 中 ID 為 $id 的資料，刪除數量: $count');
    return count;
  }

  // 刪除所有資料
  Future<int> deleteAllItems(String tableName) async {
    Database db = await database;
    int count = await db.delete(tableName);  // 刪除表中的所有資料
    print('刪除 $tableName 中的所有資料，刪除數量: $count');
    return count;
  }

  // 查詢最近一次插入的資料
  Future<Map<String, dynamic>?> getLatestItem(String tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> items = await db.query(
      tableName,
      orderBy: 'id DESC',  // 按 id 遞減排序，這樣第一筆就是最新的
      limit: 1,            // 只取一筆資料
    );
    
    if (items.isNotEmpty) {
      print('最近插入的資料: ${items.first}');
      return items.first;
    } else {
      print('無法從 $tableName 中獲取最近插入的資料');
      return null;
    }
  }
}