import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../home/presentation/tabs/home_tab/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../domain/models/user_match/user_match.dart';

part 'user_match_dto.g.dart';

part 'user_match_dto.freezed.dart';

@freezed
sealed class UserMatchDto with _$UserMatchDto {

  const UserMatchDto._();

  const factory UserMatchDto({
    required String userId,
    required TinderCardStatus matchStatus,
    required EUserMatchCompleteness completeness,
    required DateTime time,
  }) = _UserMatchDto;

  factory UserMatchDto.fromJson(
    Map<String, Object?> json,
  ) => _$UserMatchDtoFromJson(json);

  UserMatch toDomain(
    UserData user,
  ) => UserMatch(
    user: user,
    matchStatus: matchStatus,
    completeness: completeness,
    time: time,
  );

  factory UserMatchDto.fromDomain(
    UserMatch userMatch,
  ) => UserMatchDto(
    matchStatus: userMatch.matchStatus,
    completeness: userMatch.completeness,
    time: userMatch.time,
    userId: userMatch.user.uid,
  );
}
