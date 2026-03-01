import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routes/init_router/init_router.dart';
import '../../../../core/services/audio_service.dart';
import '../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../auth/domain/services/i_webrtc_service.dart';
import '../../../calls/domain/use_cases/accept_call_use_case.dart';
import '../../../calls/domain/use_cases/decline_call_use_case.dart';
import '../../../calls/domain/use_cases/hang_up_call_use_case.dart';
import '../../../calls/domain/use_cases/listen_call_use_case.dart';
import '../../../calls/domain/use_cases/listen_candidate_use_case.dart';
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
  OverlayEntry? _entry;

  @override
  void initState() {
    super.initState();

    _chatBloc =
        ChatBloc(
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
          audioService: getIt<AudioService>(),
          listenCandidateUseCase: getIt<ListenCandidateUseCase>(),
        )..add(
          CallEvent.listenCalls(),
        );
  }

  void onDecline() => _callBloc.add(
    CallEvent.decline(),
  );

  void onAccept() {
    _callBloc.add(
      CallEvent.accept(),
    );
    CallPageRoute(
      callId: _callBloc.state.aCall!.id,
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
          return BlocListener<CallBloc, CallState>(
            listenWhen: (p, n) => p.isCalling && !n.isCalling,
            listener: (context, state) {
              /// After calling accepted or declined anyway
              /// close overlay entry
              _entry?.remove();
              _entry = null;
            },
            child: BlocListener<CallBloc, CallState>(
              listener: (context, state) {
                final hasIncomingCall = state.aCall != null && state.isCalling;
                // Show overlay when there's an incoming call (user is callee) and status is calling

                if (hasIncomingCall && _entry == null) {
                  _entry = OverlayEntry(
                    builder: (_) => BlocProvider.value(
                      value: _callBloc,
                      child: IncomingCallOverlay(
                        onAccept: onAccept,
                        onDecline: onDecline,
                        onOpen: onOpen,
                      ),
                    ),
                  );

                  Overlay.of(
                    context,
                    rootOverlay: true,
                  ).insert(
                    _entry!,
                  );
                }
              },
              child: widget.navigator,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _entry?.remove();
    _entry = null;

    _callBloc.close();
    _chatBloc.close();
    _userMatchingOutcomeCubit.close();
    super.dispose();
  }
}
