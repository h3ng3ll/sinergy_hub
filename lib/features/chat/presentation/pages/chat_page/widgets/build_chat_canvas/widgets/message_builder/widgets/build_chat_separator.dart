import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../../../../../core/utils/extensions/date_time_ext.dart';
import '../../../../../../../../../../core/utils/responsive_helper.dart';

class BuildChatSeparator extends StatelessWidget {
  final DateTime time;

  const BuildChatSeparator({
    super.key,
    required this.time,
  });

  String dayText(AppLocalizations lo) {
    if (time.isToday()) {
      return lo.time_today;
    }
    else if (time.isYesterday()) {
      return lo.time_yesterday;
    }
    return DateFormat(
      'dd MMMM',
    ).format(
      time,
    );
  }

  @override
  Widget build(BuildContext context) {
    final lo = AppLocalizations.of(context)!;

    if (!ResponsiveHelper.isMobile(context)) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 6.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.antiFlashWhite.value,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: Text(
            dayText(lo),
            style: AppTextTheme.of(context).medium12.copyWith(
              color: AppColors.darkBlueGray.value,
            ),
          ),
        ),
      );
    }

    return Center(
      child: Text(
        dayText(lo),
      ),
    );
  }
}
