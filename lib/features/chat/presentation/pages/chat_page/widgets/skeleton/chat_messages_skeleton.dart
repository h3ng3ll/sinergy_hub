import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/shimmer/app_shimmer.dart';
import '../../../../../../../core/widgets/shimmer/shimmer_box.dart';

class ChatMessagesSkeleton extends StatelessWidget {
  const ChatMessagesSkeleton({super.key});

  /// (isMine, width factor, height) — listed bottom-up like the real
  /// reversed message list.
  static const List<(bool, double, double)> _bubbles = [
    (true, 0.65, 64.0),
    (false, 0.6, 44.0),
    (true, 0.32, 44.0),
    (true, 0.5, 44.0),
    (false, 0.7, 64.0),
    (true, 0.42, 44.0),
    (false, 0.55, 44.0),
    (false, 0.45, 44.0),
    (true, 0.6, 64.0),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return AppShimmer(
          child: ListView.separated(
            reverse: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            itemCount: _bubbles.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 14.0,
            ),
            itemBuilder: (context, index) {
              final (isMine, widthFactor, height) = _bubbles[index];

              return Align(
                alignment: isMine
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: ShimmerBox(
                  width: maxWidth * widthFactor,
                  height: height,
                  radius: 16.0,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
