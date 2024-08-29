import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'models/models.dart';
import 'utils/utils.dart';

/// Supported languages for AI response.
enum ResponseLanguage {
  /// English language response.
  english,

  /// Uzbek language response.
  uzbek,

  /// Russian language response.
  russian,

  /// Spanish language response.
  spanish,

  /// French language response.
  french
}

/// A utility class that provides methods for image analysis using
/// Google Generative AI API.
class VisualDetectorAi {
  /// Analyzes the given image using the Google Generative AI API.
  ///
  /// [image] is the image file to be analyzed.
  /// [geminiApiKey] is the API key for accessing Google Generative AI services.
  /// [responseLanguage] is the language in which the AI will return the response.
  ///
  /// Returns an [ImageAnalysisResult] containing the analysis result.
  /// Throws an error if the image cannot be analyzed.
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
