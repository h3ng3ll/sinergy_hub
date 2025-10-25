import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../core/utils/extensions/date_time_ext.dart';

class BuildChatSeparator extends StatelessWidget {
  final DateTime time;

  const BuildChatSeparator({
    super.key,
    required this.time,
  });

  String dayText() {
    if (time.isToday()) {
      return 'Today';
    }
    else if (time.isYesterday()) {
      return 'Yesterday';
    }
    return DateFormat(
      'dd MMMM',
    ).format(
      time,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        dayText(),
      ),
    );
  }
}
