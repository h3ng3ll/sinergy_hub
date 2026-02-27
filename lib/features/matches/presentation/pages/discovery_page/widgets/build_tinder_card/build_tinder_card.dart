import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/routes/presentation/error_message_widget.dart';
import '../../../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../domain/models/e_people_data_status.dart';
import '../../../../bloc/people_data_bloc/people_data_bloc.dart';
import '../no_found_people.dart';
import 'widgets/build_top_tinder_card_builder/widget/tinder_card_item/tinder_card_item.dart';

class BuildTinderCard extends StatelessWidget {
  final void Function(DragUpdateDetails) onPanUpdate;
  final void Function(DragEndDetails) onPanEnd;
  final void Function(DragStartDetails)? onPanStart;
  final VoidCallback onAdjustFilters;

  const BuildTinderCard({
    super.key,
    required this.onPanUpdate,
    required this.onPanEnd,
    required this.onPanStart,
    required this.onAdjustFilters,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleDataBloc, PeopleDataState>(
      builder: (context, state) {
        if (state.status == EPeopleDataStatus.loading) {
          return LoadingDataWidget();
        } else if (state.status == EPeopleDataStatus.failed) {
          return ErrorMessageWidget(
            message: state.errorMessage,
          );
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            ...state.users
                // .take(
                //   2,
                // )
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

            if (state.users.isEmpty)
              Center(
                child: NoFoundPeople(
                  onAdjustFilters: onAdjustFilters,
                ),
              ),
          ],
        );
      },
    );
  }
}
