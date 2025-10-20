import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' hide Matrix4;

import '../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../onboard_survey/doman/models/specialization/specialization.dart';
import '../../../../../../../../../../onboard_survey/doman/models/specializations/specializations.dart';
import '../../../../../../../../../domain/models/user_data/user_data.dart';
import '../../../../../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../build_tinder_status/build_tinder_status.dart';
import '../../build_top_tinder_card_builder.dart';
import 'tinder_card_static.dart';
import 'widgets/tinder_card_personal_info/tinder_card_personal_info.dart';

class TinderCardItem extends StatelessWidget {
  final UserData user;
  final void Function(DragUpdateDetails) onPanUpdate;
  final void Function(DragEndDetails) onPanEnd;
  final void Function(DragStartDetails)? onPanStart;
  final bool isActive;

  const TinderCardItem({
    super.key,
    required this.user,
    required this.onPanUpdate,
    required this.onPanEnd,
    required this.onPanStart,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final tinderCardCubit = context.watch<TinderCardCubit>().state;

    if (!isActive) {
      return TinderCardStatic(
        user: user,
      );
    }
    final angle = tinderCardCubit.rotation * pi / 180;

    final rotatedMatrix = Matrix4.identity()
      ..translateByVector3(
        Vector3(
          tinderCardCubit.position.dx,
          tinderCardCubit.position.dy,
          1,
        ),
      )
      ..rotateZ(
        angle,
      );
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
            onPanStart: onPanStart,
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(
                milliseconds: tinderCardCubit.isDragging ? 0 : 400,
              ),
              transform: rotatedMatrix
                ..translateByVector3(
                  Vector3(
                    tinderCardCubit.position.dx,
                    tinderCardCubit.position.dy,
                    1,
                  ),
                ),
              child: Stack(
                children: [
                  TinderCardStatic(
                    user: user,
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned.fill(

          child: BuildTinderStatus(
            status: tinderCardCubit.status,
          ),
        ),
      ],
    );
  }
}
