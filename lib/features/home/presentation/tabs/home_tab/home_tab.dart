import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../matches/domain/models/user_match/user_match.dart';
import '../../../../matches/presentation/bloc/user_matching_cubit/user_matching_cubit.dart';
import '../../../domain/use_cases/look_for_matches_use_case.dart';
import 'bloc/people_data_bloc/people_data_bloc.dart';
import 'bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'widgets/build_tinder_card/build_tinder_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
          userMatchingCubit: context.read<UserMatchingCubit>(),
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
      /// remove from visible
      _peopleDataBloc.add(
        PeopleDataEvent.removeVisible(),
      );

      /// save matching
      context.read<UserMatchingCubit>().create(
        match: UserMatch(
          matchStatus: status,
          user: _peopleDataBloc.state.users.last,
          time: DateTime.now(),
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
        ],
        child: BuildTinderCard(
          onAdjustFilters: onAdjustFilters,
          onPanUpdate: onPanUpdate,
          onPanStart: onPanStart,
          onPanEnd: onPanEnd,
        ),
      ),
    );
  }
}
