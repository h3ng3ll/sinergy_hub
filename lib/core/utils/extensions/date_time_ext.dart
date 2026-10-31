import 'package:intl/intl.dart';

import '../../resources/translations/app_localizations.dart';

extension DateTimeExt on DateTime {
  bool isToday() {
    return day == DateTime.now().day;
  }

  bool isYesterday() {
    return day == DateTime.now().day - 1;
  }
}

/// Below this age a timestamp reads "Just now".
const Duration _kJustNowThreshold = Duration(minutes: 1);

extension DateTimeRelativeExt on DateTime {
  /// Compact relative label for list rows: "Just now", "5m", "3h",
  /// "Yesterday", otherwise "dd MMM". Localized through [lo].
  String toRelativeLabel(AppLocalizations lo) {
    final now = DateTime.now();
    final diff = now.difference(this);
    if (diff < _kJustNowThreshold) return lo.time_just_now;
    if (diff.inHours < 1) return lo.time_minutes_short(diff.inMinutes);
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(year, month, day);
    if (date == today) return lo.time_hours_short(diff.inHours);
    if (today.difference(date).inDays == 1) return lo.time_yesterday;
    return DateFormat('dd MMM', lo.localeName).format(this);
  }
}
