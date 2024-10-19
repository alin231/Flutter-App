import 'package:flutter/material.dart';
import 'database_helper.dart';  // 引入你的 database_helper 檔案

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("Hello World");
    return MaterialApp(
      home: DatabaseTestScreen(),
    );
  }
}

class DatabaseTestScreen extends StatefulWidget {
  @override
  _DatabaseTestScreenState createState() => _DatabaseTestScreenState();
}

class _DatabaseTestScreenState extends State<DatabaseTestScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deleteController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchItems();  // 初始化時獲取所有項目
  }

  void _fetchItems() async {
    final data = await _dbHelper.queryAllItems();
    setState(() {
      _items = data;
    });
  }

  void _insertItem() async {
    String name = _nameController.text;
    String description = _descriptionController.text;

    if (name.isNotEmpty && description.isNotEmpty) {
      Map<String, dynamic> item = {
        'name': name,
        'description': description
      };
      await _dbHelper.insertItem(item);
      _nameController.clear(); // 清除輸入
      _descriptionController.clear();
      _fetchItems();  // 更新顯示資料
    }
  }

  void _deleteItem() async {
    String nameToDelete = _deleteController.text;

    if (nameToDelete.isNotEmpty) {
      await _dbHelper.deleteItemByName(nameToDelete);
      _deleteController.clear(); // 清除用戶輸入的內容
      _fetchItems(); // 刷新顯示的資料
    }
  }

  void _showAllItems() async {
    final data = await _dbHelper.queryAllItems(); // 獲取所有項目
    print(data); // 輸出資料到控制台進行檢查
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('All Items in Database'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['name']),
                  subtitle: Text(data[index]['description']),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Helper Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Item Description'),
            ),
            ElevatedButton(
              onPressed: _insertItem,
              child: Text('Insert Item'),
            ),
            TextField(
              controller: _deleteController,
              decoration: InputDecoration(labelText: 'Name to Delete'),
            ),
            ElevatedButton(
              onPressed: _deleteItem,
              child: Text('Delete Item'),
            ),
            // 新增按鈕來顯示資料庫中所有項目
            ElevatedButton(
              onPressed: _showAllItems,
              child: Text('Show All Items'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]['name']),
                    subtitle: Text(_items[index]['description']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
