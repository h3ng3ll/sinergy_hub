part of 'search_specialization_bloc.dart';

@freezed
class SearchSpecializationEvent with _$SearchSpecializationEvent {
  const factory SearchSpecializationEvent.search({
   required String query,
  }) = _Search;
const factory SearchSpecializationEvent.fetch() = _Fetch;

}
