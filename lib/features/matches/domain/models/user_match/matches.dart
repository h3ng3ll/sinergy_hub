import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'matches.g.dart';

part 'matches.freezed.dart';

enum EMatchesCompleteness {

  /// if first disliked second and second not answered to it
  none,

  /// if first liked second and second both liked first
  twoWayMatch,

  /// first time user liked another user
  oneWayMatch,

  // /// if one user disliked another and from opposite it liked first one
  // incomeOneWayMatch,



}

extension MatchesX on Matches {
  bool get isOneWayMatch => completeness == EMatchesCompleteness.oneWayMatch;

  bool get isTwoWayMatch => completeness == EMatchesCompleteness.twoWayMatch;

  bool get isNone => completeness == EMatchesCompleteness.none;
}

@freezed
sealed class Matches with _$Matches {
  const factory Matches({
    required String matchId,
    required UserData user,
    required TinderCardStatus matchStatus,

    /// If oneWayMatch it is mean one side
    /// matched as liked and other side received as none
    /// If other size confirm both completeness must
    /// transform to twoWayMatch
    @Default(EMatchesCompleteness.none) EMatchesCompleteness completeness,
    required DateTime time,
    // Vision Align — насколько совпадают цели,
    // видение, подходы двух людей.
    // Можно оценивать по описаниям профилей / текстам о себе. 0 -10
    int? align ,


    /// Берём Experience.experience (junior, middle, senior, leadExpert).
    // Считаем совпадение, например:
    // 10/10 — один уровень разницы (например middle-middle)
    // 8/10 — разница на один уровень (junior-middle)
    // 5/10 — разница на два уровня
    // 0/10 — разница на три уровня

    // Можно учесть rangeExperience (годы опыта) для тонкой настройки.
    int? experienceScore ,
    int? skillsMatch ,
    int? visionScore ,
  }) = _Matches;

  factory Matches.fromJson(Map<String, Object?> json) =>
      _$MatchesFromJson(json);
}
