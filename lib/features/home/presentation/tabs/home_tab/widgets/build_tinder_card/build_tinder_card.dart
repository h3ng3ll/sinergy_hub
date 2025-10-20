import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di/injection.dart';
import '../../../../../../../core/routes/presentation/error_message_widget.dart';
import '../../../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../domain/repositories/i_user_data_repository.dart';
import '../../bloc/people_data_bloc/people_data_bloc.dart';
import '../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'widgets/build_tinder_status/build_tinder_status.dart';
import 'widgets/build_top_tinder_card_builder/widget/tinder_card_item/tinder_card_item.dart';

class BuildTinderCard extends StatelessWidget {
  final void Function(DragUpdateDetails) onPanUpdate;
  final void Function(DragEndDetails) onPanEnd;
  final void Function(DragStartDetails)? onPanStart;

  const BuildTinderCard({
    super.key,
    required this.onPanUpdate,
    required this.onPanEnd,
    required this.onPanStart,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleDataBloc, PeopleDataState>(
      builder: (context, state) {
        if (state.status == PeopleDataStatus.loading) {
          return LoadingDataWidget();
        } else if (state.status == PeopleDataStatus.failed) {
          return ErrorMessageWidget(
            message: state.errorMessage,
          );
        }
        return Stack(
          children: [
            ...state.users
                .take(
                  2,
                )
                .map(
                  (e) => Align(
                    alignment: Alignment.bottomCenter,
                    child: TinderCardItem(
                      user: e,
                      onPanUpdate: onPanUpdate,
                      onPanStart: onPanStart,
                      onPanEnd: onPanEnd,
                      isActive: e == state.users.last,
                    ),
                  ),
                ),
          ],
        );
      },
    );
  }
}
