import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  NotificationConfigBloc({
    required GetNotificationsConfigUseCase getNotificationsConfigUseCase,
    required SaveNotificationsConfigUseCase saveNotificationsConfigUseCase,
    required RegisterCurrentDeviceTokenUseCase
    registerCurrentDeviceTokenUseCase,
  }) : _getNotificationsConfigUseCase = getNotificationsConfigUseCase,
       _saveNotificationsConfigUseCase = saveNotificationsConfigUseCase,
       _registerCurrentDeviceTokenUseCase = registerCurrentDeviceTokenUseCase,

       super(const NotificationConfigState()) {
    on<_Init>(_init);
    on<_Save>(_save);
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
}
