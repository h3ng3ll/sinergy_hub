import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../domain/repositories/i_user_data_repository.dart';
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
  final TinderCardCubit _tinderCardCubit = TinderCardCubit(
    size: Size(
      300.0,
      600.0,
    ),
  );
  final PeopleDataBloc _peopleDataBloc = PeopleDataBloc(
    userRepository: getIt<IUserDataRepository>(),
  ) ..add(
    PeopleDataEvent.loadPeoples(),
  );

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
      _peopleDataBloc.add(
        PeopleDataEvent.removeVisible(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _peopleDataBloc
           ,
        ),
        BlocProvider<TinderCardCubit>.value(
          value: _tinderCardCubit,
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Center(
          //   child: NoFoundPeople(
          //     onAdjustFilters: onAdjustFilters,
          //   ),
          // ),
          BuildTinderCard(
            onPanUpdate: onPanUpdate,
            onPanStart: onPanStart,
            onPanEnd: onPanEnd,
          ),
        ],
      ),
    );
  }
}
