




import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../home/presentation/tabs/home_tab/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'user_match.g.dart';

part 'user_match.freezed.dart';


enum EUserMatchCompleteness {
  oneWayMatch,
  twoWayMatch,
  none,
}
@freezed
sealed class UserMatch with _$UserMatch {
  const factory UserMatch({
    required UserData user,
    required TinderCardStatus matchStatus,

    /// If oneWayMatch it is mean one side
    /// matched as liked and other side received as none
    /// If other size confirm both completeness must
    /// transform to twoWayMatch
    @Default(EUserMatchCompleteness.none) EUserMatchCompleteness completeness,
    required DateTime time,
    @Default('') String icon,
  }) = _UserMatch;

  factory UserMatch.fromJson(Map<String, Object?> json) =>
      _$UserMatchFromJson(json);
}