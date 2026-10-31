import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../notifications/domain/models/notification_config/notification_config.dart';
import '../../../../notifications/domain/usecases/get_notification_config_use_case.dart';
import '../../../../notifications/domain/usecases/save_notification_config_use_case.dart';

part 'settings_notification_event.dart';

part 'settings_notification_state.dart';

part 'settings_notification_state_ext.dart';

part 'settings_notification_bloc.freezed.dart';

class SettingsNotificationBloc
    extends Bloc<SettingsNotificationEvent, SettingsNotificationState> {
  final GetNotificationsConfigUseCase _getNotificationsConfigUseCase;
  final SaveNotificationsConfigUseCase _saveNotificationsConfigUseCase;

  SettingsNotificationBloc({
    required GetNotificationsConfigUseCase getNotificationsConfigUseCase,
    required SaveNotificationsConfigUseCase saveNotificationsConfigUseCase,
  }) : _getNotificationsConfigUseCase = getNotificationsConfigUseCase,
       _saveNotificationsConfigUseCase = saveNotificationsConfigUseCase,
       super(const SettingsNotificationState()) {
    on<_Load>(_load);
    on<_Toggle>(_toggle);
  }

  Future<void> _load(
    _Load event,
    Emitter<SettingsNotificationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ESettingsNotificationStatus.loading,
      ),
    );

    final result = await _getNotificationsConfigUseCase.call();

    result.fold(
      (config) {
        /// A new user has no stored config yet → fall back to the model
        /// default (notifications enabled).
        final resolved = config ?? const NotificationConfig();
        emit(
          state.copyWith(
            status: ESettingsNotificationStatus.ready,
            config: resolved,
            enabledNotifications: resolved.enabledNotifications,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          status: ESettingsNotificationStatus.failed,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  Future<void> _toggle(
    _Toggle event,
    Emitter<SettingsNotificationState> emit,
  ) async {
    final previous = state.enabledNotifications;
    if (event.enabled == previous) return;

    /// Optimistic: reflect the new value immediately so the switch responds,
    /// then persist. Preserve the rest of the config (e.g. fcmTokens) via
    /// copyWith — mirrors NotificationConfigBloc._save.
    final config = state.config.copyWith(
      enabledNotifications: event.enabled,
    );
    emit(
      state.copyWith(
        status: ESettingsNotificationStatus.saving,
        config: config,
        enabledNotifications: event.enabled,
      ),
    );

    final result = await _saveNotificationsConfigUseCase.call(
      config: config,
    );

    result.fold(
      (_) => emit(
        state.copyWith(
          status: ESettingsNotificationStatus.ready,
        ),
      ),
      (failure) => emit(
        /// Revert the toggle on failure.
        state.copyWith(
          status: ESettingsNotificationStatus.failed,
          config: state.config.copyWith(
            enabledNotifications: previous,
          ),
          enabledNotifications: previous,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
