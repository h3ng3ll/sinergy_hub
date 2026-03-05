import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import '../../../domain/usecases/look_for_matches_use_case.dart';
import '../../bloc/people_data_bloc/people_data_bloc.dart';
import '../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../../matches/presentation/bloc/user_matches_outcome_cubit/user_matches_outcome_cubit.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import 'widgets/build_has_match/build_has_match.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    _tinderCardCubit.close();
    _peopleDataBloc.close();
    super.dispose();
  }

  void onAdjustFilters() {}

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
      await context.read<UserMatchesOutcomeCubit>().create(
        status: status,
        matchedID: lastUser.uid,
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
        ],
        child: BlocListener<UserMatchesOutcomeCubit, UserMatchesOutcomeState>(
          listener: (context, state) {
            if (state.status == UserMatchesOutcomeStatus.failed) {
              UiMessageService.showError(
                state.errorMessage,
              );
            }
            // _peopleDataBloc.add(
            //   PeopleDataEvent.updateViewedPeoples(
            //     uids: state.userMatches
            //         .map(
            //           (e) => e.user.uid,
            //         )
            //         .toList(),
            //   ),
            // );
            if (state.status == UserMatchesOutcomeStatus.foundMatch) {
              showDialog(
                context: context,
                builder: (_) => BuildHasMatch(
                  matchedUser: _peopleDataBloc.state.users.first,
                  onSendMessage: () => onSendMessage(
                    _peopleDataBloc.state.users.first,
                  ),
                  onKeepSwiping: onKeepSwiping,
                ),
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
