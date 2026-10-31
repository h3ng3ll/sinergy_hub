import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive_helper.dart';

/// Fixed width of the header/search column in the desktop layout.
const double _kSideColumnWidth = 320.0;

/// Tablet/desktop layout for the "pick from a list" edit pages.
///
/// Desktop: header + search pinned in a left column, [content] fills the
/// right. Tablet: header + search on top, [content] below.
class SelectionPageLayout extends StatelessWidget {
  final Widget header;
  final Widget? search;
  final Widget content;

  const SelectionPageLayout({
    super.key,
    required this.header,
    required this.content,
    this.search,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveHelper.isDesktop(
      MediaQuery.sizeOf(context).width,
    );

    final intro = [
      header,
      ?search,
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32.0,
        children: [
          SizedBox(
            width: _kSideColumnWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 24.0,
                children: intro,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
              ),
              child: content,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 20.0,
      children: [
        ...intro,
        Expanded(
          child: content,
        ),
      ],
    );
  }
}
