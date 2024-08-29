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
            final data = await VisualDetectorAi.analyzeImage(
              image: /// image_file,
              geminiApiKey: 'YOUR_GEMINI_API_KEY',
              responseLanguage: ResponseLanguage.english,
            );

            // response
            print(data);
          },
          child: const Text('Analyze'),
        ),
      ),
    );
  }
}
