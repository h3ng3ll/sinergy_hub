import 'package:flutter/material.dart';

import '../../../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'widgets/icon_status/status/info_status.dart';
import 'widgets/icon_status/status/liked_status.dart';

class BuildTinderStatus extends StatelessWidget {
  final TinderCardStatus status;

  const BuildTinderStatus({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case TinderCardStatus.liked:
        return Align(
          alignment: Alignment(
            0.5,
            -1.0,
          ),
          child: LikedStatus(),
        );
      case TinderCardStatus.reject:
        return Align(

          alignment: Alignment(
            -0.5,
            -1.0,
          ),
          child: RejectStatus(),
        );
      case TinderCardStatus.none:
        return Container();
    }
  }
}
