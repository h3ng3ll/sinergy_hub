import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/converters/timestamp_convertor.dart';
import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/domain/models/role/role.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../onboard_survey/domain/models/user_profiler/user_profiler.dart';

part 'user_data.g.dart';

part 'user_data.freezed.dart';

@freezed
sealed class UserData with _$UserData {
  const UserData._();

  const factory UserData({
    required String uid,
    String? avatarUrl,
    String? avatarPath,
    String? firstName,
    String? lastName,
    int? age,
    String? aboutMe,
    required UserProfiler profiler,
    @TimestampConverter() required DateTime createdAt,
    @Default(false) bool isOnline,
    @TimestampConverter() required DateTime lastSeen,
  }) = _UserData;

  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) => _$UserDataFromJson(json);

  factory UserData.none() => UserData(
    uid: 'uid',
    profiler: UserProfiler.none(),
    createdAt: DateTime.now(),
    lastSeen: DateTime.now(),
  );



  @override
  String toString() {
    return 'UserData(uid: $uid, name: $firstName $lastName, age: $age)';
  }
}
