part of 'people_data_bloc.dart';

@freezed
class PeopleDataEvent with _$PeopleDataEvent {
  const factory PeopleDataEvent.loadPeoples() = _LoadPeoples;
  const factory PeopleDataEvent.removeVisible() = _RemoveVisible;
}
