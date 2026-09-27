import 'package:flutter/material.dart';

import '../../../discovery_page/widgets/build_tinder_card/widgets/build_tinder_status/widgets/icon_status/status/liked_status.dart';
import '../../../discovery_page/widgets/build_tinder_card/widgets/build_tinder_status/widgets/icon_status/status/reject_status.dart';

const double _kActionSize = 56.0;

class LikedYouActions extends StatelessWidget {
  final VoidCallback? onLike;
  final VoidCallback? onReject;

  const LikedYouActions({
    super.key,
    required this.onLike,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12.0,
      children: [
        RejectStatus(
          onTap: onReject?.call,
          width: _kActionSize,
          height: _kActionSize,
        ),
        LikedStatus(
          onTap: onLike?.call,
          width: _kActionSize,
          height: _kActionSize,
        ),
      ],
    );
  }
}
