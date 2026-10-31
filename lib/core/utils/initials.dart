/// Up to two upper-case initials from the non-empty [parts], or `?`.
String initialsOf(List<String?> parts) {
  final letters = parts
      .map((e) => e?.trim() ?? '')
      .where((e) => e.isNotEmpty)
      .take(2)
      .map((e) => e[0].toUpperCase());
  return letters.isEmpty ? '?' : letters.join();
}
