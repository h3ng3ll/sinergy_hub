import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/firebase/firebase_messaging_service.dart';
import '../../../auth/domain/services/i_webrtc_service.dart';
import '../../../calls/domain/use_cases/accept_call_use_case.dart';
import '../../../calls/domain/use_cases/start_call_use_case.dart';
import '../../../calls/presentation/bloc/call_bloc/call_bloc.dart';
import '../../../chat/presentation/bloc/chat_cubit/chat_cubit.dart';
import '../../../matches/domain/usecases/get_user_matches_outcome_use_case.dart';
import '../../../matches/presentation/bloc/user_matches_outcome_cubit/user_matches_outcome_cubit.dart';
import '../../../notifications/domain/usecases/get_notification_config_use_case.dart';
import '../../../notifications/domain/usecases/save_notification_config_use_case.dart';
import '../../../notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';
import '../../../user/presentation/bloc/user_cubit/user_cubit.dart';

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
  late final ChatCubit _chatBloc;
  late final UserMatchesOutcomeCubit _userMatchingOutcomeCubit;

  @override
  void initState() {
    super.initState();
    final userCubit = context.read<UserCubit>();

    _chatBloc =
        ChatCubit(
          getChatsUseCase: getIt(),
          initChatUseCase: getIt(),
          userCubit: userCubit,
        )..init(
          userCubit.uid!,
        );

    _userMatchingOutcomeCubit = UserMatchesOutcomeCubit(
      userCubit: userCubit,
      createUserMatchesUseCase: getIt(),
      getUserMatchesOutcomeUseCase: getIt<GetUserMatchesOutcomeUseCase>(),
    );
  }

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
        BlocProvider(
          create: (_) => CallBloc(
            startCallUseCase: getIt<StartCallUseCase>(),
            acceptCallUseCase: getIt<AcceptCallUseCase>(),
            webRtcService: getIt<IWebRtcService>(),
          ),
        ),
      ],
      child: widget.navigator,
    );
  }

  @override
  void dispose() {
    _chatBloc.close();
    _userMatchingOutcomeCubit.close();
    super.dispose();
  }
}
