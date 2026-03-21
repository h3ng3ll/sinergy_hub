import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/timestamp_convertor.dart';
import '../../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../domain/models/user_match/matches.dart';

part 'matches_dto.g.dart';

part 'matches_dto.freezed.dart';

@freezed
sealed class MatchesDto with _$MatchesDto {
  const MatchesDto._();

  const factory MatchesDto({
    required List<String> answeredUids,
    required EMatchesCompleteness completeness,
    @Default(0) int experienceScore,
    required String matchId,
    required TinderCardStatus matchStatus,
    @Default(0) skillsMatch,
    @Default(0) int skillsScore,
  @TimestampConverter()  required DateTime time,
    required List<String> users,
    @Default(0) int visionScore,
  }) = _MatchesDto;

  factory MatchesDto.fromJson(
    Map<String, Object?> json,
  ) => _$MatchesDtoFromJson(json);

  Matches toDomain(
    UserData user,
  ) => Matches(
    user: user,
    matchStatus: matchStatus,
    completeness: completeness,
    time: time,
    experienceScore: experienceScore,
    skillsMatch: skillsMatch,
    visionScore: visionScore,
    matchId: matchId,
  );

  // factory MatchesDto.fromDomain(
  //   Matches matches,
  // ) => MatchesDto(
  //   matchStatus: matches.matchStatus,
  //   completeness: matches.completeness,
  //   time: matches.time,
  //   userId: matches.user.uid,
  //   experienceScore: matches.experienceScore,
  //   skillsMatch: matches.skillsMatch,
  //   visionScore: matches.visionScore,
  //   answeredUids: [],
  //   matchId: null,
  //   users: [],
  // );
}
