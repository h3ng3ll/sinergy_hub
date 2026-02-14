import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../domain/models/specialization/specialization.dart';
import '../../bloc/search_specialization_bloc/search_specialization_bloc.dart';
import '../../widgets/build_onboard_bottom_actions.dart';
import '../../widgets/onboard_survey_header.dart';
import '../../widgets/survey_card/survey_card.dart';
import 'widgets/search_input.dart';

class SpecializationStage extends StatelessWidget {
  final Specialization? selectedSpecialization;
  final void Function(String) onSpecializationChanged;
  final Function(Specialization) onSelectSpecialization;
  final Function(RenderBox, Specialization) onLongPressed;
  final VoidCallback? onTapContinue;
  final VoidCallback skipForNow;

  const SpecializationStage({
    super.key,
    required this.onSpecializationChanged,
    required this.selectedSpecialization,
    required this.onSelectSpecialization,
    required this.onLongPressed,
    this.onTapContinue,
    required this.skipForNow,
  });

  void onSearchSpecialization(
    BuildContext context,
    String query,
  ) {
    context.read<SearchSpecializationBloc>().add(
      SearchSpecializationEvent.search(
        query: query,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchSpecializationBloc()
        ..add(
          SearchSpecializationEvent.fetch(),
        ),
      child: BlocBuilder<SearchSpecializationBloc, SearchSpecializationState>(
        builder: (context, state) {
          final specializations = state.specializations;
          return HorizontalPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: OnboardSurveyHeader(
                    title: 'What is your specific specialization? ',
                    description: 'Help us find your perfect co-founder match',
                  ),
                ),
                Gap(20.0),
                SearchInput(
                  onChanged:
                      (
                        query,
                      ) => onSearchSpecialization(
                        context,
                        query,
                      ),
                  hintText: 'Search your specialization...',
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      final e = specializations[index];

                      return SurveyCard(
                        isSelected: selectedSpecialization == e,
                        colors: e.colors,
                        icon: e.icon,
                        title: e.name,
                        description: e.particulars.join(
                          ',',
                        ),
                        onTap: () => onSelectSpecialization(
                          e,
                        ),
                        onLongPress: (renderBox) => onLongPressed(
                          renderBox,
                          e,
                        ),
                      );
                    },
                    itemBuilder: (BuildContext context, int index) => Gap(
                      20.0,
                    ),
                    itemCount: specializations.length,
                  ),
                ),
                BuildOnboardBottomActions(
                  skipForNow: skipForNow,
                  onPressed: onTapContinue,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
