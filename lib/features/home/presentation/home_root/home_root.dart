import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routes/init_router/init_router.dart';
import '../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../auth/domain/services/i_webrtc_service.dart';
import '../../../calls/domain/use_cases/accept_call_use_case.dart';
import '../../../calls/domain/use_cases/decline_call_use_case.dart';
import '../../../calls/domain/use_cases/hang_up_call_use_case.dart';
import '../../../calls/domain/use_cases/listen_call_use_case.dart';
import '../../../calls/domain/use_cases/start_call_use_case.dart';
import '../../../calls/presentation/bloc/call_bloc/call_bloc.dart';
import '../../../calls/presentation/overlay/incoming_call_overlay/incoming_call_overlay.dart';
import '../../../chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import '../../../matches/domain/usecases/get_user_matches_outcome_use_case.dart';
import '../../../matches/presentation/bloc/user_matches_outcome_cubit/user_matches_outcome_cubit.dart';
import '../../../notifications/domain/usecases/get_notification_config_use_case.dart';
import '../../../notifications/domain/usecases/get_notifications_use_case.dart';
import '../../../notifications/domain/usecases/save_notification_config_use_case.dart';
import '../../../notifications/domain/usecases/save_notification_use_case.dart';
import '../../../notifications/presentation/bloc/notification_bloc/notification_bloc.dart';
import '../../../notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';

class HomeRoot extends StatefulWidget {
  final Widget navigator;

  const HomeRoot({
    super.key,
    required this.navigator,
  });

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  late final ChatBloc _chatBloc;
  late final UserMatchesOutcomeCubit _userMatchingOutcomeCubit;
  late final CallBloc _callBloc;

  @override
  void initState() {
    super.initState();

    _chatBloc = ChatBloc(
      getChatsUseCase: getIt(),
      initChatUseCase: getIt(),
    )..add(
      const ChatEvent.init(),
    );

    _userMatchingOutcomeCubit = UserMatchesOutcomeCubit(
      createUserMatchesUseCase: getIt(),
      getUserMatchesOutcomeUseCase: getIt<GetUserMatchesOutcomeUseCase>(),
    );
    _callBloc =
        CallBloc(
          startCallUseCase: getIt<StartCallUseCase>(),
          acceptCallUseCase: getIt<AcceptCallUseCase>(),
          declineCallUseCase: getIt<DeclineCallUseCase>(),
          hangUpCallUseCase: getIt<HangUpCallUseCase>(),
          listenCallUseCase: getIt<ListenCallUseCase>(),
          webRtcService: getIt<IWebRtcService>(),
        )..add(
          CallEvent.listenCalls(),
        );
  }

  void onDecline() => _callBloc.add(
    CallEvent.accept(),
  );

  void onAccept() {
    _callBloc.add(
      CallEvent.accept(),
    );
    CallPageRoute(
      calleeId: _callBloc.state.aCall!.calleeId,
    ).push(
      context,
    );
  }

  void onOpen() {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _chatBloc,
        ),
        BlocProvider.value(
          value: _userMatchingOutcomeCubit,
        ),
        BlocProvider(
          lazy: false,
          create: (_) =>
              NotificationConfigBloc(
                getNotificationsConfigUseCase:
                    getIt<GetNotificationsConfigUseCase>(),
                saveNotificationsConfigUseCase:
                    getIt<SaveNotificationsConfigUseCase>(),
                firebaseMessagingService: getIt<FirebaseMessagingService>(),
              )..add(
                NotificationConfigEvent.init(),
              ),
        ),
        BlocProvider<NotificationBloc>(
          create: (_) =>
              NotificationBloc(
                getNotificationsUseCase: getIt<GetNotificationsUseCase>(),
                saveNotificationUseCase: getIt<SaveNotificationUseCase>(),
              )..add(
                NotificationEvent.get(),
              ),
        ),

        /// Listen calls if user authorized at the first loading
        BlocProvider.value(
          value: _callBloc,
        ),
      ],
      child: Builder(
        builder: (context) {
          final callsBloc = context.watch<CallBloc>().state;
          return Stack(
            children: [
              widget.navigator,

              if (callsBloc.isCalling)
                IncomingCallOverlay(
                  onAccept: onAccept,
                  onDecline: onDecline,
                  onOpen: onOpen,
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _callBloc.close();
    _chatBloc.close();
    _userMatchingOutcomeCubit.close();
    super.dispose();
  }
}
