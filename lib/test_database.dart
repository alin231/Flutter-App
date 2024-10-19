import 'package:flutter/material.dart';
import 'database_helper.dart'; // 引入你的 database_helper 檔案

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  final TextEditingController _chineseWordController = TextEditingController();
  final TextEditingController _englishWordController = TextEditingController();
  final TextEditingController _punController = TextEditingController();
  final TextEditingController _definitionController = TextEditingController();
  final TextEditingController _deleteController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchItems(); // 初始化時獲取所有項目
  }

  void _fetchItems() async {
    final data = await _dbHelper.getItems('user_words'); // 查詢 user_words 表
    setState(() {
      _items = data;
    });
  }

  void _insertItem() async {
    String chineseWord = _chineseWordController.text;
    String englishWord = _englishWordController.text;
    String pun = _punController.text;
    String definition = _definitionController.text;

    if (chineseWord.isNotEmpty && englishWord.isNotEmpty && pun.isNotEmpty && definition.isNotEmpty) {
      Map<String, dynamic> item = {
        'chinese_word': chineseWord,
        'english_word': englishWord,
        'pun': pun,
        'definition': definition
      };
      await _dbHelper.insertItem('user_words', item);
      _chineseWordController.clear();
      _englishWordController.clear();
      _punController.clear();
      _definitionController.clear();
      _fetchItems(); // 更新顯示資料
    }
  }

    void _showAllItems() async {
    final data = await _dbHelper.getItems('user_words'); // 獲取所有 user_words 表中的項目
    print(data); // 輸出資料到控制台進行檢查
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('All Items in user_words'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['chinese_word'] ?? 'Unknown'),
                  subtitle: Text(
                      '英文: ${data[index]['english_word']}\n諧音: ${data[index]['pun']}\n解釋: ${data[index]['definition']}'),
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
        title: Text('User Words Database Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _chineseWordController,
              decoration: InputDecoration(labelText: '中文單字'),
            ),
            TextField(
              controller: _englishWordController,
              decoration: InputDecoration(labelText: '英文單字'),
            ),
            TextField(
              controller: _punController,
              decoration: InputDecoration(labelText: '諧音'),
            ),
            TextField(
              controller: _definitionController,
              decoration: InputDecoration(labelText: '解釋'),
            ),
            ElevatedButton(
              onPressed: _insertItem,
              child: Text('Insert Item'),
            ),
            TextField(
              controller: _deleteController,
              decoration: InputDecoration(labelText: 'Word to Delete (中文單字)'),
            ),
            
            ElevatedButton(
              onPressed: _showAllItems,
              child: Text('Show All Items'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]['chinese_word'] ?? 'Unknown'),
                    subtitle: Text(
                        '英文: ${_items[index]['english_word']}\n諧音: ${_items[index]['pun']}\n解釋: ${_items[index]['definition']}'),
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
