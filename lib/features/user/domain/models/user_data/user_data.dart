import 'package:freezed_annotation/freezed_annotation.dart';
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
    String? firstName,
    String? lastName,
    int? age,
    String? aboutMe,
    required UserProfiler profiler,
  }) = _UserData;

  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) => _$UserDataFromJson(json);

   factory UserData.none() => UserData(
    uid: 'uid',
    profiler: UserProfiler(
      specialization: ESpecialization.fullStackDeveloper,
      role: ERole.productManager,
      experience: EExperience.senior,
      searchingSpecializations: [],
      skills: [],
    ),
  );

  @override
  String toString() {
    return 'UserData(uid: $uid, name: $firstName $lastName, age: $age)';
  }
}
