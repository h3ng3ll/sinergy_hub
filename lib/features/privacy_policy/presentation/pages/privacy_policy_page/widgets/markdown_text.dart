import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';

class MarkdownText extends StatelessWidget {
  final String source;

  const MarkdownText({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorScheme = AppColorScheme.of(context);
    final baseColor = colorScheme.onPrimary;

    final blocks = _parseBlocks(source);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final block in blocks) ...[
          _renderBlock(block, textTheme, baseColor),
          Gap(block.bottomGap),
        ],
      ],
    );
  }

  Widget _renderBlock(
    _MdBlock block,
    AppTextTheme textTheme,
    Color baseColor,
  ) {
    switch (block.type) {
      case _MdBlockType.h1:
        return Text.rich(
          _inlineSpans(block.text, textTheme.bold26.copyWith(color: baseColor)),
          style: textTheme.bold26.copyWith(color: baseColor),
        );
      case _MdBlockType.h2:
        return Text.rich(
          _inlineSpans(block.text, textTheme.bold20.copyWith(color: baseColor)),
          style: textTheme.bold20.copyWith(color: baseColor),
        );
      case _MdBlockType.h3:
        return Text.rich(
          _inlineSpans(block.text, textTheme.bold17.copyWith(color: baseColor)),
          style: textTheme.bold17.copyWith(color: baseColor),
        );
      case _MdBlockType.paragraph:
        return Text.rich(
          _inlineSpans(
            block.text,
            textTheme.regular14.copyWith(color: baseColor),
          ),
          style: textTheme.regular14.copyWith(color: baseColor),
        );
      case _MdBlockType.listItem:
        final style = textTheme.regular14.copyWith(color: baseColor);
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('•  ', style: style),
              Expanded(
                child: Text.rich(
                  _inlineSpans(block.text, style),
                  style: style,
                ),
              ),
            ],
          ),
        );
    }
  }

  static List<_MdBlock> _parseBlocks(String src) {
    final lines = src.split('\n');
    final blocks = <_MdBlock>[];
    final paragraphBuffer = StringBuffer();

    void flushParagraph() {
      final text = paragraphBuffer.toString().trim();
      paragraphBuffer.clear();
      if (text.isEmpty) return;
      blocks.add(_MdBlock(_MdBlockType.paragraph, text));
    }

    for (final raw in lines) {
      final line = raw.trimRight();
      if (line.trim().isEmpty) {
        flushParagraph();
        continue;
      }
      if (line.startsWith('### ')) {
        flushParagraph();
        blocks.add(_MdBlock(_MdBlockType.h3, line.substring(4).trim()));
        continue;
      }
      if (line.startsWith('## ')) {
        flushParagraph();
        blocks.add(_MdBlock(_MdBlockType.h2, line.substring(3).trim()));
        continue;
      }
      if (line.startsWith('# ')) {
        flushParagraph();
        blocks.add(_MdBlock(_MdBlockType.h1, line.substring(2).trim()));
        continue;
      }
      final listMatch = RegExp(r'^\s*-\s+(.*)$').firstMatch(line);
      if (listMatch != null) {
        flushParagraph();
        blocks.add(_MdBlock(_MdBlockType.listItem, listMatch.group(1)!));
        continue;
      }
      if (paragraphBuffer.isNotEmpty) {
        paragraphBuffer.write(' ');
      }
      paragraphBuffer.write(line.trim());
    }
    flushParagraph();
    return blocks;
  }

  static TextSpan _inlineSpans(String text, TextStyle baseStyle) {
    final spans = <TextSpan>[];
    final tokens = _tokenizeInline(text);
    for (final token in tokens) {
      spans.add(TextSpan(text: token.text, style: token.styleFor(baseStyle)));
    }
    return TextSpan(style: baseStyle, children: spans);
  }

  static List<_InlineToken> _tokenizeInline(String input) {
    final tokens = <_InlineToken>[];
    var i = 0;
    final buf = StringBuffer();
    var bold = false;
    var italic = false;

    void flush() {
      if (buf.isEmpty) return;
      tokens.add(
        _InlineToken(buf.toString(), bold: bold, italic: italic),
      );
      buf.clear();
    }

    while (i < input.length) {
      if (i + 1 < input.length &&
          input[i] == '*' &&
          input[i + 1] == '*') {
        flush();
        bold = !bold;
        i += 2;
        continue;
      }
      if (input[i] == '*' || input[i] == '_') {
        flush();
        italic = !italic;
        i += 1;
        continue;
      }
      buf.write(input[i]);
      i += 1;
    }
    flush();
    return tokens;
  }
}

enum _MdBlockType {
  h1,
  h2,
  h3,
  paragraph,
  listItem,
}

class _MdBlock {
  final _MdBlockType type;
  final String text;

  const _MdBlock(this.type, this.text);

  double get bottomGap {
    switch (type) {
      case _MdBlockType.h1:
        return 16.0;
      case _MdBlockType.h2:
        return 12.0;
      case _MdBlockType.h3:
        return 8.0;
      case _MdBlockType.paragraph:
        return 12.0;
      case _MdBlockType.listItem:
        return 6.0;
    }
  }
}

class _InlineToken {
  final String text;
  final bool bold;
  final bool italic;

  const _InlineToken(
    this.text, {
    required this.bold,
    required this.italic,
  });

  TextStyle styleFor(TextStyle base) {
    return base.copyWith(
      fontWeight: bold ? FontWeight.w700 : base.fontWeight,
      fontStyle: italic ? FontStyle.italic : base.fontStyle,
    );
  }
}
