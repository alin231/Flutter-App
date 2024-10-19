import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/take_picture_screen.dart';
Future<void> main() async {
  // 確保初始化插件服務，這樣才能在 `runApp()` 之前調用 `availableCameras()`
  WidgetsFlutterBinding.ensureInitialized();

  // 獲取設備上可用相機的列表
  final cameras = await availableCameras();

  // 選擇一個相機作為示例
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera),
    ),
  );
}
