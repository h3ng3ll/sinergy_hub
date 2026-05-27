import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/services/connectivity_service.dart';

part 'connectivity_event.dart';

part 'connectivity_state.dart';

part 'connectivity_bloc.freezed.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityService _connectivityService;
  StreamSubscription<bool>? _subscription;

  ConnectivityBloc({
    required ConnectivityService connectivityService,
  })  : _connectivityService = connectivityService,
        super(
          ConnectivityState(
            status: connectivityService.isInitialised
                ? (connectivityService.isOnline
                    ? ConnectivityStatus.online
                    : ConnectivityStatus.offline)
                : ConnectivityStatus.initial,
          ),
        ) {
    on<_StatusChanged>(_onStatusChanged);

    _subscription = _connectivityService.stream.listen(
      (isOnline) => add(ConnectivityEvent.statusChanged(isOnline: isOnline)),
    );
  }

  void _onStatusChanged(
    _StatusChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    emit(
      state.copyWith(
        status: event.isOnline
            ? ConnectivityStatus.online
            : ConnectivityStatus.offline,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
