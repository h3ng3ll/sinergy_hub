




import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_status.g.dart';

part 'onboard_status.freezed.dart';

@freezed
sealed class OnboardStatus with _$OnboardStatus {
  const factory OnboardStatus({
    @Default(false) bool toldAboutYourself,
    @Default(false) bool completeSpecialization,
  }) = _OnboardStatus;

  factory OnboardStatus.fromJson(Map<String, Object?> json) =>
      _$OnboardStatusFromJson(json);
}