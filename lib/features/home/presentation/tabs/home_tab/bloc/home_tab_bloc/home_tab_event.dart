part of 'home_tab_bloc.dart';

@freezed
class HomeTabEvent with _$HomeTabEvent {
  const factory HomeTabEvent.loadPeoples() = _LoadPeoples;
}
