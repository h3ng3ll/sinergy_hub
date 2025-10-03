import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/converters/color_serializable.dart';

part 'specialization.g.dart';

part 'specialization.freezed.dart';

enum ESpecialization {
  frontendDeveloper,
  mobileDeveloper,
  backendDeveloper,
  fullStackDeveloper,
  devopsEngineer,
  dataScientistMLEngineer,
  qaTestAutomation,
  techLeadCTO,
}

@freezed
sealed class Specialization with _$Specialization {
  const factory Specialization({
    required String name,
    required List<String> particulars,
    @ColorSerializable() @Default([]) List<Color> colors,
    @Default('') String icon,
  }) = _Specialization;

  factory Specialization.fromJson(Map<String, Object?> json) =>
      _$SpecializationFromJson(json);
}
