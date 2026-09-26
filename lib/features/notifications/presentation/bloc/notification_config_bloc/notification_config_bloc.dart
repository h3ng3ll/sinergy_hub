import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../domain/models/notification_config/notification_config.dart';
import '../../../domain/usecases/get_notification_config_use_case.dart';
import '../../../domain/usecases/register_current_device_token_use_case.dart';
import '../../../domain/usecases/save_notification_config_use_case.dart';

part 'notification_config_event.dart';

part 'notification_config_state.dart';

part 'notification_config_bloc.freezed.dart';

class NotificationConfigBloc
    extends Bloc<NotificationConfigEvent, NotificationConfigState> {
  final GetNotificationsConfigUseCase _getNotificationsConfigUseCase;
  final SaveNotificationsConfigUseCase _saveNotificationsConfigUseCase;
  final RegisterCurrentDeviceTokenUseCase _registerCurrentDeviceTokenUseCase;
  StreamSubscription<String>? _tokenRefreshSubscription;

  NotificationConfigBloc({
    required GetNotificationsConfigUseCase getNotificationsConfigUseCase,
    required SaveNotificationsConfigUseCase saveNotificationsConfigUseCase,
    required RegisterCurrentDeviceTokenUseCase
    registerCurrentDeviceTokenUseCase,
    required FirebaseMessagingService firebaseMessagingService,
  }) : _getNotificationsConfigUseCase = getNotificationsConfigUseCase,
       _saveNotificationsConfigUseCase = saveNotificationsConfigUseCase,
       _registerCurrentDeviceTokenUseCase = registerCurrentDeviceTokenUseCase,

       super(const NotificationConfigState()) {
    /// AuthBloc re-emits `authorized` several times on start-up and each emit
    /// dispatches init — drop overlapping runs so only one read+upsert races.
    on<_Init>(_init, transformer: droppable());
    on<_Save>(_save);
    on<_TokenRefreshed>(_onTokenRefreshed);

    // Converts the service's token-rotation stream into bloc events — the
    // subscription itself lives for the bloc's lifetime (it's a lazy
    // singleton) and is torn down in close(). This is NOT the same pattern
    // as calling stream.listen() inside a handler: it is set up once, in
    // the constructor, exactly like main.dart wires AuthBloc into other
    // blocs.
    _tokenRefreshSubscription = firebaseMessagingService.onTokenRefresh.listen(
      (token) => add(NotificationConfigEvent.tokenRefreshed(token: token)),
    );
  }

  Future<void> _init(
    _Init event,
    Emitter<NotificationConfigState> emit,
  ) async {
    emit(state.copyWith(status: NotificationConfigStatus.loading));

    final loadResult = await _getNotificationsConfigUseCase.call();
    final NotificationConfig? loaded = loadResult.fold(
      (config) => config,
      (failure) {
        emit(
          state.copyWith(
            status: NotificationConfigStatus.failed,
            errorMessage: failure.message,
          ),
        );
        return null;
      },
    );
    if (loadResult.isRight()) return;

    final NotificationConfig seed = loaded ?? state.config;
    final registerResult = await _registerCurrentDeviceTokenUseCase.call(
      config: seed,
    );

    registerResult.fold(
      (config) => emit(
        state.copyWith(
          config: config,
          status: NotificationConfigStatus.initial,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          config: seed,
          status: NotificationConfigStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _save(
    _Save event,
    Emitter<NotificationConfigState> emit,
  ) async {
    final config = state.config.copyWith(
      enabledNotifications:
          event.isEnabledNotifications ?? state.config.enabledNotifications,
    );
    if (config == state.config) return;

    emit(state.copyWith(status: NotificationConfigStatus.loading));

    final result = await _saveNotificationsConfigUseCase.call(config: config);

    result.fold(
      (_) => emit(
        state.copyWith(
          config: config,
          status: NotificationConfigStatus.initial,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: NotificationConfigStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _onTokenRefreshed(
    _TokenRefreshed event,
    Emitter<NotificationConfigState> emit,
  ) async {
    // The refresh stream already hands over the new token directly, so no
    // fcmTokenReady wait is needed here — see RegisterCurrentDeviceTokenUseCase.
    final registerResult = await _registerCurrentDeviceTokenUseCase.call(
      config: state.config,
      tokenOverride: event.token,
    );

    registerResult.fold(
      (config) => emit(
        state.copyWith(config: config),
      ),
      (failure) => emit(
        state.copyWith(
          status: NotificationConfigStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _tokenRefreshSubscription?.cancel();
    return super.close();
  }
}
