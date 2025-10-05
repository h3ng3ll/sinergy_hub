part of 'search_specialization_bloc.dart';

@freezed
sealed class SearchSpecializationState with _$SearchSpecializationState {
  const factory SearchSpecializationState({
    @Default('') String query,
    @Default([]) List<Specialization> specializations,
  }) = _SearchSpecializationState;
}
