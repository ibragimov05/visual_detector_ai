# Visual Detector AI

`visual_detector_ai` is a Flutter package that integrates with the Google Generative AI API to analyze images. It allows you to send an image to the API and receive detailed analysis results.

## Features

- Analyze images using the Google Generative AI API.
- Support for multiple response languages.

## Installation

Add the `visual_detector_ai` package to your `pubspec.yaml` file:

```yaml
dependencies:
  visual_detector_ai: ^1.0.0
```
Then, run `flutter pub` get to install the package.

Usage
Import the Package:

`import 'package:visual_detector_ai/visual_detector_ai.dart';`

Obtain API Key:

To use the Google Generative AI API, you need an API key. You can obtain one by following these steps:

Go to [Google AI Studio](https://aistudio.google.com/).
Sign in with your Google account or create a new one if you don't have an account.
Follow the instructions to create a new project and generate an API key.
Copy your API key and keep it secure.

Analyze an Image:

Use the `VisualDetectorAi.analyzeImage` method to analyze an image file.

```
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:visual_detector_ai/visual_detector_ai.dart';

void main() => runApp(
  const MaterialApp(
    home: VisionDetectorAiExample(),
  ),
);

class VisionDetectorAiExample extends StatefulWidget {
  const VisionDetectorAiExample({super.key});

  @override
  State<VisionDetectorAiExample> createState() =>
      _VisionDetectorAiExampleState();
}

class _VisionDetectorAiExampleState extends State<VisionDetectorAiExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VISION DETECTOR AI EXAMPLE')),
      body: Center(
        child: FilledButton(
          onPressed: () async {
            // Replace with the path to your image file
            final File imageFile = File('path/to/your/image.jpg');

            final data = await VisualDetectorAi.analyzeImage(
              image: imageFile,
              geminiApiKey: 'YOUR_GEMINI_API_KEY',
              responseLanguage: ResponseLanguage.english,
            );

            // Handle the response
            print(data);
          },
          child: const Text('Analyze'),
        ),
      ),
    );
  }
}
```
API
VisualDetectorAi.analyzeImage
```
static Future<ImageAnalysisResult> analyzeImage({
  required File image,
  required String geminiApiKey,
  ResponseLanguage responseLanguage = ResponseLanguage.english,
}) async
```
Parameters:

* image - The image file to be analyzed.
* geminiApiKey - Your API key for the Google Generative AI service.
* responseLanguage - (Optional) Language for the response. Default is English.
  Returns:

`Future<ImageAnalysisResult>` - The result of the image analysis.
ResponseLanguage
Enum for supported response languages:

* english
* uzbek
* russian
* spanish
* french

Error Handling:

The analyzeImage method will throw an error if the analysis fails. Ensure to handle exceptions as needed.

```
try {
  final data = await VisualDetectorAi.analyzeImage(
    image: imageFile,
    geminiApiKey: 'YOUR_GEMINI_API_KEY',
    responseLanguage: ResponseLanguage.english,
  );
  print(data);
} catch (e) {
  print('Error: $e');
}
```
Contributing
Contributions are welcome! Please submit a pull request or open an issue if you encounter any problems.