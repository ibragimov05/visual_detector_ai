class ImageAnalysisResult {
  final String name;
  final String description;
  final num confidencePercent;

  const ImageAnalysisResult({
    required this.name,
    required this.description,
    required this.confidencePercent,
  });

  factory ImageAnalysisResult.fromJson(Map<String, dynamic> json) =>
      ImageAnalysisResult(
        name: json['name'].toString(),
        description: json['description'].toString(),
        confidencePercent: json['confidence_percent'] as num,
      );

  @override
  String toString() =>
      'ImageAnalysisResult(name: $name, description: $description, confidence: $confidencePercent)';
}
