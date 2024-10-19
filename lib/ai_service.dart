import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/global_variables.dart' as global;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:io';

Future<String> generateAIResponse(String prompt) async {
  final apiKey = global.apiKey; // Ensure global is accessible
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    exit(1);
  }
  
  final model = GenerativeModel(
    model: 'tunedModels/trainedmodel-4cayin7v72qz',
    apiKey: apiKey,
    safetySettings: [
      SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.high)
    ],
    generationConfig: GenerationConfig(maxOutputTokens: 200),
  );
  
  final content = [Content.text("$prompt")];
  final response = await model.generateContent(content);
  
  return response.text?.toString() ?? '';
}