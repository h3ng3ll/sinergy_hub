part of 'connectivity_bloc.dart';

enum ConnectivityStatus {
  initial,
  online,
  offline,
}

extension ConnectivityStateX on ConnectivityState {
  bool get isOnline => status == ConnectivityStatus.online;

  bool get isOffline => status == ConnectivityStatus.offline;

  bool get isResolved => status != ConnectivityStatus.initial;
}

@freezed
sealed class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({
    @Default(ConnectivityStatus.initial) ConnectivityStatus status,
  }) = _ConnectivityState;
}
