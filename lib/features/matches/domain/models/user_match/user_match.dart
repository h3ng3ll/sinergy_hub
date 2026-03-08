import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'user_match.g.dart';

part 'user_match.freezed.dart';

enum EUserMatchCompleteness {

  /// if first disliked second and second not answered to it
  none,

  /// if first liked second and second both liked first
  twoWayMatch,

  /// first time user liked another user
  oneWayMatch,

  // /// if one user disliked another and from opposite it liked first one
  // incomeOneWayMatch,



}

extension UserMatchX on UserMatch {
  bool get isOneWayMatch => completeness == EUserMatchCompleteness.oneWayMatch;

  bool get isTwoWayMatch => completeness == EUserMatchCompleteness.twoWayMatch;

  bool get isNone => completeness == EUserMatchCompleteness.none;
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
