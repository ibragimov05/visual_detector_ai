extension StringExtensions on String {
  String get clearJson {
    if (startsWith("```")) {
      return split("```")[1].substring(4);
    }
    return this;
  }
}
