part of 'skills_bloc.dart';

enum SkillsStatus {
  initial,
  loading,
  loaded,
  failed,
}

@freezed
sealed class SkillsState with _$SkillsState {
  const factory SkillsState({
    @Default(SkillsStatus.initial) SkillsStatus status,
    @Default([]) List<String> skills,
    @Default('') String errorMessage,
  }) = _SkillsState;
}
