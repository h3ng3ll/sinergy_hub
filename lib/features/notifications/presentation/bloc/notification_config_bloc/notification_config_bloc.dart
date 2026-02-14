import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../domain/models/notification_config/notification_config.dart';
import '../../../domain/usecases/get_notification_config_use_case.dart';
import '../../../domain/usecases/save_notification_config_use_case.dart';

part 'notification_config_event.dart';

part 'notification_config_state.dart';

part 'notification_config_bloc.freezed.dart';

class NotificationConfigBloc
    extends Bloc<NotificationConfigEvent, NotificationConfigState> {
  final GetNotificationsConfigUseCase _getNotificationsConfigUseCase;
  final SaveNotificationsConfigUseCase _saveNotificationsConfigUseCase;
  final FirebaseMessagingService _firebaseMessagingService;

  NotificationConfigBloc({
    required GetNotificationsConfigUseCase getNotificationsConfigUseCase,
    required SaveNotificationsConfigUseCase saveNotificationsConfigUseCase,
    required FirebaseMessagingService firebaseMessagingService,
  }) : _getNotificationsConfigUseCase = getNotificationsConfigUseCase,
       _firebaseMessagingService = firebaseMessagingService,
       _saveNotificationsConfigUseCase = saveNotificationsConfigUseCase,

       super(const NotificationConfigState()) {
    on<_Init>(_init);
    on<_Save>(_save);
  }

  Future<NotificationConfig> _primarySetup(NotificationConfig config) async {
    /// Add token if current device not has been registered
    final token = _firebaseMessagingService.fcmToken;
    if (!config.fcmTokens.contains(token)) {
      config = config.copyWith(
        fcmTokens: [...config.fcmTokens, token],
      );
      await _saveNotificationsConfigUseCase.call(
        config: config,
      );
    }

    return config;
  }

  void _init(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: NotificationConfigStatus.loading,
        ),
      );
      NotificationConfig config =
          await _getNotificationsConfigUseCase.call() ?? state.config;

      config = await _primarySetup(
        config,
      );
      emit(
        state.copyWith(
          config: config,
          status: NotificationConfigStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NotificationConfigStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  void _save(event, emit) async {
    try {
      final config = state.config.copyWith(
        enabledNotifications:
            event.isEnabledNotifications ?? state.config.enabledNotifications,
      );
      if (config == state.config) return;

      emit(
        state.copyWith(
          status: NotificationConfigStatus.loading,
        ),
      );
      await _saveNotificationsConfigUseCase.call(
        config: state.config,
      );
      emit(
        state.copyWith(
          status: NotificationConfigStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NotificationConfigStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
