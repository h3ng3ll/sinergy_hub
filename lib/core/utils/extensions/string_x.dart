

import '../../../features/chat/domain/models/text_type/text_type.dart';

extension StringX on String {
  List<TextType> parseChatMessage() {
    final urlRegex = RegExp(r'(https?:\/\/[^\s]+)');
    final emailRegex = RegExp(r'[\w\.-]+@[\w\.-]+\.\w+');

    final List<TextType> result = [];

    int start = 0;

    final matches = [
      ...urlRegex.allMatches(this),
      ...emailRegex.allMatches(this),
    ]..sort((a, b) => a.start.compareTo(b.start));

    for (final match in matches) {
      if (match.start > start) {
        result.add(
          TextType.text(substring(start, match.start)),
        );
      }

      final value = match.group(0)!;

      if (urlRegex.hasMatch(value)) {
        result.add(TextType.url(value));
      } else {
        result.add(TextType.email(value));
      }

      start = match.end;
    }

    if (start < length) {
      result.add(TextType.text(substring(start)));
    }

    return result;
  }
}