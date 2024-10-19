import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Import your Google Generative AI package here
import 'package:google_generative_ai/google_generative_ai.dart';
import 'global_variables.dart' as global;
import 'iphone_14_15_pro_two/iphone_14_15_pro_two_screen.dart';

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
            print("hello1\n");
            // final path = join(
            //   (await getTemporaryDirectory()).path,
            //   '${DateTime.now()}.png',
            // );
            

            // Take the picture and save it to the specified path
            XFile picture = await _controller.takePicture();
            print("hello2\n");

            // Get the detected word from the image
            String detectedWord = await _getWordFromImage(picture.path);
            print(detectedWord);
            global.norminput = detectedWord;

            // Navigate to the display screen with the image path and result
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Iphone1415ProTwoScreen(),
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
    final apiKey = global.apiKey; // Ensure global is accessible
    if (apiKey == null) {
      stderr.writeln(r'No $GEMINI_API_KEY environment variable');
      exit(1);
    }
    
    final prompt = "Detect the single word in the image. If detect successfully, just return the single word. If there are multiple words, respond with ";
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
      safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.high)
      ],
      generationConfig: GenerationConfig(maxOutputTokens: 200),
    );
    final imageBytes = await File(imagePath).readAsBytes();
    final encodedImage = base64Encode(imageBytes);

    final response = await model.generateContent([
      Content.text("$prompt"),
      Content.text("$encodedImage"),
    ]);

    String detectedText = response.text ?? 'No response';

    if (detectedText.split(' ').length > 1) {
      return "Cannot detect your target word.";
    }

    return detectedText;
  }
}

// 顯示拍攝的圖片
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String result;

  const DisplayPictureScreen({Key? key, required this.imagePath, required this.result}) : super(key: key);

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
