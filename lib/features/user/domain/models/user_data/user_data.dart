import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../onboard_survey/doman/models/user_profiler/user_profiler.dart';

part 'user_data.g.dart';

part 'user_data.freezed.dart';

@freezed
sealed class UserData with _$UserData {
  const factory UserData({
    required String uid,
    String? avatarUrl,
    String? firstName,
    String? lastName,
    int? age,
    String? aboutMe,
    required UserProfiler profiler,
  }) = _UserData;

  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) => _$UserDataFromJson(json);

  @override
  String toString() {
    return 'UserData(uid: $uid, name: $firstName $lastName, age: $age)';
  }
}
