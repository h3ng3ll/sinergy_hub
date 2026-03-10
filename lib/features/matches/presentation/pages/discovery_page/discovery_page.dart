import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/look_for_matches_use_case.dart';
import '../../../domain/usecases/listen_two_way_match_use_case.dart';
import '../../bloc/people_data_bloc/people_data_bloc.dart';
import '../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../bloc/matches_bloc/matches_bloc.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import 'widgets/build_tinder_card/build_tinder_card.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({
    super.key,
  });

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  late final TinderCardCubit _tinderCardCubit;
  late final PeopleDataBloc _peopleDataBloc;
  late final MatchesBloc _matchesBloc;

  @override
  void initState() {
    _tinderCardCubit = TinderCardCubit(
      size: Size(
        300.0,
        600.0,
      ),
    );
    _peopleDataBloc =
        PeopleDataBloc(
          lookForMatchesUseCase: getIt<LookForMatchesUseCase>(),
        )..add(
          PeopleDataEvent.loadPeoples(),
        );
    _matchesBloc =
        MatchesBloc(
          listenTwoWayMatchUseCase: getIt<ListenTwoWayMatchUseCase>(),
          createUserMatchesUseCase: getIt<CreateUserMatchesUseCase>(),
        )..add(
          const MatchesEvent.startListening(),
        );
    super.initState();
  }

  @override
  void dispose() {
    _tinderCardCubit.close();
    _peopleDataBloc.close();
    _matchesBloc.close();
    super.dispose();
  }

  void onAdjustFilters() {
    // MatchResultPageRoute().push(
    //   context,
    // );
  }

  void onKeepSwiping() {}

  Future<void> onSendMessage(UserData matchedUser) async {
    context.read<ChatBloc>().add(
      ChatEvent.createChat(
        uid: matchedUser.uid,
      ),
    );

    // Wait for chat to be created and get the chatId from state
    final chatBloc = context.read<ChatBloc>();
    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (chatBloc.state.createdChatId.isNotEmpty) {
        return false;
      }
      if (chatBloc.state.status == ChatStatus.failed) {
        return false;
      }
      return true;
    });

    final chatId = chatBloc.state.createdChatId;
    if (!mounted) return;

    ChatPageRoute(
      chatId: chatId,
    ).go(
      context,
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    _tinderCardCubit.onPanUpdate(
      details,
    );
  }

  void onPanEnd(DragEndDetails details) async {
    final status = await _tinderCardCubit.onPanEnd(
      details,
    );
    if (status != TinderCardStatus.none && mounted) {
      final lastUser = _peopleDataBloc.state.users.last;

      /// remove from visible
      _peopleDataBloc.add(
        PeopleDataEvent.removeVisible(),
      );

      /// save matching
      _matchesBloc.add(
        MatchesEvent.create(
          status: status,
          matchedID: lastUser.uid,
        ),
      );
    }
  }

  void onPanStart(DragStartDetails details) {
    _tinderCardCubit.onPanStart(
      details,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _peopleDataBloc,
          ),
          BlocProvider<TinderCardCubit>.value(
            value: _tinderCardCubit,
          ),
          BlocProvider.value(
            value: _matchesBloc,
          ),
        ],
        child: BlocListener<MatchesBloc, MatchesState>(
          listener: (context, state) {
            if (state.status == MatchesStatus.foundMatch &&
                state.userMatch != null) {
              MatchResultPageRoute(
                matchId: state.userMatch!.matchId,
              ).push(
                context,
              );
            }
            if (state.status == MatchesStatus.failed) {
              UiMessageService.showError(
                state.errorMessage,
              );
            }
          },
          child: BuildTinderCard(
            onAdjustFilters: onAdjustFilters,
            onPanUpdate: onPanUpdate,
            onPanStart: onPanStart,
            onPanEnd: onPanEnd,
          ),
        ),
      ),
    );
  }
}
