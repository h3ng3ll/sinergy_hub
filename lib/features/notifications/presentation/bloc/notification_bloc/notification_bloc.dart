import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/notification/notification.dart';
import '../../../domain/usecases/get_notifications_use_case.dart';
import '../../../domain/usecases/save_notification_use_case.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_state_ext.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final SaveNotificationUseCase _saveNotificationUseCase;

  NotificationBloc({
    required GetNotificationsUseCase getNotificationsUseCase,
    required SaveNotificationUseCase saveNotificationUseCase,
  }) : _saveNotificationUseCase = saveNotificationUseCase,
       _getNotificationsUseCase = getNotificationsUseCase,
       super(const NotificationState()) {
    on<_Get>(_get);
    on<_Push>(_push);
  }

  void _get(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: NotificationStatus.loading,
        ),
      );
      final notifications = await _getNotificationsUseCase.call();

      emit(
        state.copyWith(
          notifications: notifications,
          status: NotificationStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NotificationStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }

  void _push(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: NotificationStatus.loading,
        ),
      );
      // final data = event.e;
      /// Todo:

      emit(
        state.copyWith(
          status: NotificationStatus.initial,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NotificationStatus.failed,
          errorMessage: e.toString(),
        ),
      );
      rethrow;
    }
  }
}
