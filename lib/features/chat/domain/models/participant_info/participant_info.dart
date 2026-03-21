import 'package:freezed_annotation/freezed_annotation.dart';


part 'participant_info.g.dart';

part 'participant_info.freezed.dart';

@freezed
abstract class ParticipantInfo with _$ParticipantInfo {
  const factory ParticipantInfo({
    @Default('') String id,
    @Default('') String name,
    String? avatarUrl,
    @Default('') String specialization,
    // required ESpecialization specialization,
  }) = _ParticipantsInfo;

  factory ParticipantInfo.fromJson(
    Map<String, Object?> json,
  ) => _$ParticipantsInfoFromJson(
    json,
  );
}
