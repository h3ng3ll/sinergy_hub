import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'ice_candidate.g.dart';

part 'ice_candidate.freezed.dart';

@freezed
sealed class IceCandidate with _$IceCandidate {
  const factory IceCandidate({
    required String candidate,
    String? sdpMid,
    int? sdpMineIndex,
  }) = _IceCandidate;

  factory IceCandidate.fromJson(Map<String, Object?> json) =>
      _$IceCandidateFromJson(json);
}
