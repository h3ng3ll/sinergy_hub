import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' hide Matrix4;

import '../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../onboard_survey/doman/models/specialization/specialization.dart';
import '../../../../../../../../../../onboard_survey/doman/models/specializations/specializations.dart';
import '../../../../../../../../../domain/models/user_data/user_data.dart';
import '../../../../../../bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../build_top_tinder_card_builder.dart';
import 'widgets/tinder_card_personal_info/tinder_card_personal_info.dart';

class TinderCardStatic extends StatelessWidget {
  final UserData user;

  const TinderCardStatic({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = 17.5;

    final Specialization specialization =
        Specializations.all[user.profiler.specialization]!;
    final tinderCardCubit = context.watch<TinderCardCubit>().state;

    return  Container(
      height: tinderCardCubit.cardSize.height,
      width: tinderCardCubit.cardSize.width,
      decoration: BoxDecoration(
        color: AppColors.white.value,

        border: Border.all(
          color: specialization.colors.first,
          width: 3,
        ),

        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Column(
        children: [
          BuildTopTinderCard(
            specialization: specialization,
            borderRadius: borderRadius,
            imgUrl: user.avatarUrl,
            colorOfSpecialization: specialization.colors.first,
          ),
          TinderCardPersonalInfo(
            specialization: specialization,
            user: user,
          ),
        ],
      ),
    );
  }
}
