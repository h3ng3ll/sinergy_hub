import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/color_serializable.dart';
import '../experience/experience.dart';
import '../role/role.dart';
import '../specialization/specialization.dart';

part 'user_profiler.g.dart';

part 'user_profiler.freezed.dart';



@freezed
sealed class UserProfiler with _$UserProfiler {
  const factory UserProfiler({
    required ESpecialization specialization,
    required ERole role,
    required EExperience experience,
    required List<ESpecialization> searchingSpecializations,
  }) = _UserProfiler;

  factory UserProfiler.fromJson(Map<String, dynamic> json) =>
      _$UserProfilerFromJson(json);
}
