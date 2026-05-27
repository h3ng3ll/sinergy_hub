part of 'connectivity_bloc.dart';

@freezed
sealed class ConnectivityEvent with _$ConnectivityEvent {
  const factory ConnectivityEvent.statusChanged({
    required bool isOnline,
  }) = _StatusChanged;
}
