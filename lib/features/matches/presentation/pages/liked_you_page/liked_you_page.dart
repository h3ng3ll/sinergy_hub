import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../subscription/presentation/bloc/premium_bloc/premium_bloc.dart';
import '../../../../subscription/presentation/dialogs/paywall_modal_sheet/paywall_modal_sheet.dart';
import '../../../domain/models/liked_you/liked_you_item.dart';
import '../../../domain/usecases/create_user_matches_use_case.dart';
import '../../../domain/usecases/get_liked_you_use_case.dart';
import '../../../domain/usecases/watch_liked_you_changes_use_case.dart';
import '../../bloc/liked_you_bloc/liked_you_bloc.dart';
import '../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'widgets/failed_liked_you/failed_liked_you.dart';
import 'widgets/liked_you_builder/liked_you_builder.dart';
import 'widgets/no_found_liked_you/no_found_liked_you.dart';

class LikedYouPage extends StatefulWidget {
  const LikedYouPage({super.key});

  @override
  State<LikedYouPage> createState() => _LikedYouPageState();
}

class _LikedYouPageState extends State<LikedYouPage> {
  late final LikedYouBloc _likedYouBloc;
  bool _isPaywallOpen = false;

  @override
  void initState() {
    _likedYouBloc =
        LikedYouBloc(
            getLikedYouUseCase: getIt<GetLikedYouUseCase>(),
            watchLikedYouChangesUseCase: getIt<WatchLikedYouChangesUseCase>(),
            createUserMatchesUseCase: getIt<CreateUserMatchesUseCase>(),
          )
          ..add(
            const LikedYouEvent.load(),
          )
          ..add(
            const LikedYouEvent.watchChanges(),
          );
    super.initState();
  }

  @override
  void dispose() {
    _likedYouBloc.close();
    super.dispose();
  }

  void _onLoad() {
    _likedYouBloc.add(const LikedYouEvent.load());
  }

  void _onReachToEnd() {
    _likedYouBloc.add(const LikedYouEvent.loadMore());
  }

  void _onRetryLoadMore() {
    _likedYouBloc.add(const LikedYouEvent.loadMore());
  }

  Future<void> _onShowPaywall() async {
    if (_isPaywallOpen) return;
    _isPaywallOpen = true;
    await PaywallModalSheet.show(context);
    _isPaywallOpen = false;
  }

  void _onLike(LikedYouItem item) {
    _likedYouBloc.add(
      LikedYouEvent.respond(
        item: item,
        status: TinderCardStatus.liked,
      ),
    );
  }

  void _onReject(LikedYouItem item) {
    _likedYouBloc.add(
      LikedYouEvent.respond(
        item: item,
        status: TinderCardStatus.reject,
      ),
    );
  }

  void _onActionResult(BuildContext context, LikedYouState state) {
    if (state.isActionLimitReached) {
      _onShowPaywall();
      return;
    }
    if (state.isActionFailed) {
      UiMessageService.showError(state.errorMessage);
    }
  }

  void _onPremiumChanged() {
    _likedYouBloc.add(const LikedYouEvent.refresh());
  }

  Future<void> _onRefresh() async {
    _likedYouBloc.add(const LikedYouEvent.refresh());
    final result = await _likedYouBloc.stream.firstWhere(
      (state) => !state.isRefreshing,
    );
    if (result.isFailed) {
      await UiMessageService.showError(result.errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: _likedYouBloc,
      child: BlocListener<PremiumBloc, PremiumState>(
        listenWhen: (previous, current) =>
            previous.isPremium != current.isPremium,
        listener: (context, state) => _onPremiumChanged(),
        child: BlocListener<LikedYouBloc, LikedYouState>(
          listenWhen: (previous, current) =>
              previous.actionStatus != current.actionStatus,
          listener: _onActionResult,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocBuilder<LikedYouBloc, LikedYouState>(
              builder: (context, state) {
                if (state.isFailed && state.isEmpty) {
                  return FailedLikedYou(
                    errorMessage: state.errorMessage,
                    onRetry: _onLoad,
                  );
                }
                if (state.isLoading && state.isEmpty) {
                  return const CustomLoadingIndicator();
                }
                if (state.isEmpty) {
                  return NoFoundLikedYou(
                    onReload: _onLoad,
                  );
                }
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: LikedYouBuilder(
                    items: state.items,
                    quota: state.quota,
                    isLoadingMore: state.isLoadingMore,
                    isLoadMoreFailed: state.isLoadMoreFailed,
                    onReachToEnd: _onReachToEnd,
                    onRetryLoadMore: _onRetryLoadMore,
                    onShowPaywall: _onShowPaywall,
                    onLike: _onLike,
                    onReject: _onReject,
                    respondingIds: state.respondingIds,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
