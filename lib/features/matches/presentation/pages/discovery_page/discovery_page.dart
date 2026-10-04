import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import '../../../domain/models/matches_filter/matches_filter.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/get_cached_discovery_deck_use_case.dart';
import '../../../domain/usecases/look_for_matches_use_case.dart';
import '../../../domain/usecases/remove_from_discovery_deck_use_case.dart';
import '../../../domain/usecases/save_discovery_deck_use_case.dart';
import '../../../domain/usecases/listen_two_way_match_use_case.dart';
import '../../bloc/people_data_bloc/people_data_bloc.dart';
import '../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../bloc/matches_bloc/matches_bloc.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../subscription/presentation/dialogs/paywall_modal_sheet/paywall_modal_sheet.dart';
import 'widgets/build_tinder_card/build_tinder_card.dart';
import '../../dialogs/filter_modal/matches_filters_modal_sheet.dart';

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
  bool _isPaywallOpen = false;

  @override
  void initState() {
    _tinderCardCubit = getIt<TinderCardCubit>();
    _peopleDataBloc =
        PeopleDataBloc(
          lookForMatchesUseCase: getIt<LookForMatchesUseCase>(),
          getCachedDiscoveryDeckUseCase: getIt<GetCachedDiscoveryDeckUseCase>(),
          saveDiscoveryDeckUseCase: getIt<SaveDiscoveryDeckUseCase>(),
          removeFromDiscoveryDeckUseCase:
              getIt<RemoveFromDiscoveryDeckUseCase>(),
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

  Future<void> onAdjustFilters() async {
    final MatchesFilter? result = await MatchesFiltersModalSheet.show(
      HomeBottomBarRoute.homeBottomBarKey.currentState!.context,
      initialOptions: _peopleDataBloc.state.filter,
    );

    if (result == null) return;
    _peopleDataBloc.add(
      PeopleDataEvent.applyFilter(
        filter: result,
      ),
    );
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
          user: lastUser,
        ),
      );
    }
  }

  void onPanStart(DragStartDetails details) {
    _tinderCardCubit.onPanStart(
      details,
    );
  }

  void _onResetFilter() {
    _peopleDataBloc.add(
      PeopleDataEvent.removeFilter(),
    );
  }

  Future<void> _onShowPaywall() async {
    if (_isPaywallOpen) return;
    _isPaywallOpen = true;
    await PaywallModalSheet.show(
      HomeBottomBarRoute.homeBottomBarKey.currentState!.context,
    );
    _isPaywallOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
        listenWhen: (prev, curr) => prev.status != curr.status,
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
            final failed = state.lastFailedUser;
            if (failed != null) {
              _peopleDataBloc.add(
                PeopleDataEvent.restoreVisible(
                  user: failed,
                ),
              );
            }
          }
          if (state.status == MatchesStatus.limitReached) {
            final failed = state.lastFailedUser;
            if (failed != null) {
              _peopleDataBloc.add(
                PeopleDataEvent.restoreVisible(
                  user: failed,
                ),
              );
            }
            _onShowPaywall();
          }
        },
        child: Builder(
          builder: (context) {
            final isApplied = context
                .watch<PeopleDataBloc>()
                .state
                .filter
                .isApplied;
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                actions: [
                  if (isApplied)
                    InkWell(
                      onTap: _onResetFilter,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.filter_list_off_outlined,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  IconButton(
                    icon: Stack(
                      children: [
                        const Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                        if (isApplied)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onPressed: onAdjustFilters,
                    tooltip: 'Filters',
                  ),
                ],
              ),
              body: BuildTinderCard(
                onAdjustFilters: onAdjustFilters,
                onPanUpdate: onPanUpdate,
                onPanStart: onPanStart,
                onPanEnd: onPanEnd,
              ),
            );
          },
        ),
      ),
    );
  }
}
