part of 'matches_bloc.dart';

@freezed
class MatchesEvent with _$MatchesEvent {
  const factory MatchesEvent.startListening() = _StartListening;

  const factory MatchesEvent.create({
    required TinderCardStatus status,
    required String matchedID,
  }) = _Create;
}