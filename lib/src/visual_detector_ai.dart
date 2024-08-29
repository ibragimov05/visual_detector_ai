import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'models/models.dart';
import 'utils/utils.dart';

enum ResponseLanguage { english, uzbek, russian, spanish, french }

class VisualDetectorAi {
  static Future<ImageAnalysisResult> analyzeImage({
    required File image,
    required String geminiApiKey,
    ResponseLanguage responseLanguage = ResponseLanguage.english,
  }) async {
    try {
      final Uint8List imageBytes = await image.readAsBytes();

      final GenerativeModel model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: geminiApiKey,
      );

      final DataPart dataPart = DataPart('image/jpeg', imageBytes);

      final content = [
        Content.multi([
          TextPart(AiConstants.analyzePrompt(
            responseLanguage: responseLanguage,
          )),
          dataPart
        ]),
      ];

      final GenerateContentResponse response =
          await model.generateContent(content);

      if (response.text == null) {
        throw 'Could not find summary';
      } else {
        return ImageAnalysisResult.fromJson(
            jsonDecode(response.text!.clearJson));
      }
    } catch (e) {
      rethrow;
    }
  }
}
