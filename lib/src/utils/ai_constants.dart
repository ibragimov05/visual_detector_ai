import '../visual_detector_ai.dart';

class AiConstants {
  static String analyzePrompt({
    required ResponseLanguage responseLanguage,
  }) =>
      '''
  Analyze the provided image to identify the primary object.
  
  Your response should be in the following JSON format:
  
  {
    "name": "Name of the main object (String)",
    "description": "Description of the main object (up to 100 words)",
    "confidence_percent": "Confidence level as a integer number (e.g., 76)"
  }
  
  Ensure that the response is correctly formatted with no extra text 
  or syntax errors outside the curly brackets. Give me response in ${responseLanguage.name} language, please.
  Thank you!
  ''';
}
