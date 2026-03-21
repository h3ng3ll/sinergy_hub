import 'package:freezed_annotation/freezed_annotation.dart';


part 'participants_info.g.dart';

part 'participants_info.freezed.dart';

@freezed
abstract class ParticipantsInfo with _$ParticipantsInfo {
  const factory ParticipantsInfo({
    @Default('') String id,
    @Default('') String name,
    String? avatarUrl,
    @Default('') String specialization,
    // required ESpecialization specialization,
  }) = _ParticipantsInfo;

  factory ParticipantsInfo.fromJson(
    Map<String, Object?> json,
  ) => _$ParticipantsInfoFromJson(
    json,
  );
}
