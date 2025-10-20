
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/color_serializable.dart';
import '../../../../onboard_survey/doman/models/experience/experience.dart';
import '../../../../onboard_survey/doman/models/role/role.dart';
import '../../../../onboard_survey/doman/models/specialization/specialization.dart';
import '../../../../onboard_survey/doman/models/user_profiler/user_profiler.dart';

part 'user_data.g.dart';
part 'user_data.freezed.dart';


@freezed
sealed class UserData with _$UserData {
  const factory UserData({
    String? avatarUrl,
    String? firstName ,
    String? lastName ,
    int? age ,
    String? aboutMe,
    required UserProfiler profiler,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
