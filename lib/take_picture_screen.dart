import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Import your Google Generative AI package here
import 'package:google_generative_ai/google_generative_ai.dart';


// 創建並初始化 CameraController
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({Key? key, required this.camera}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('拍照')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            XFile picture = await _controller.takePicture();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }


Future<String> _getWordFromImage(String imagePath) async {
    // Initialize the Gemini model
    final model = GenerativeModel("gemini-1.5-flash");

    // Read the image file as bytes
    final imageBytes = await File(imagePath).readAsBytes();

    // Send the request to the Gemini API with a specific prompt
    final response = await model.generateContent([
      'Detect the single word in the image. If detect successfully, just return the single word. If there are multiple words, respond with "Cannot detect your target word."',
      base64Encode(imageBytes),
    ]);

    // Check the response for the specific phrase
    String detectedText = response.text ?? 'No response';
    
    // Handle the detection of multiple words
    if (detectedText.split(' ').length > 1) {
      return "Cannot detect your target word.";
    }

    return detectedText; // Return the detected word if only one
  }
}

// 顯示拍攝的圖片
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String result;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('顯示照片')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(File(imagePath)),
          SizedBox(height: 20),
          Text('Result: $result', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
