import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/bloc/search_specialization_bloc/search_specialization_bloc.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/specialization_stage/widgets/search_input.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/onboard_survey_header.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/survey_card/survey_card.dart';
import 'bloc/edit_looking_for_bloc.dart';

class EditLookingForPage extends StatelessWidget {
  const EditLookingForPage({super.key});

  void _onSearchSpecialization(
    BuildContext context,
    String query,
  ) {
    context.read<SearchSpecializationBloc>().add(
      SearchSpecializationEvent.search(
        query: query,
      ),
    );
  }

  void _onToggleSpecialization(
    BuildContext context,
    ESpecialization specialization,
  ) {
    context.read<EditLookingForBloc>().add(
      EditLookingForEvent.toggleSpecialization(
        specialization: specialization,
      ),
    );
  }

  void _onSave(BuildContext context) {
    context.read<EditLookingForBloc>().add(
      const EditLookingForEvent.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<EditLookingForBloc>()
            ..add(
              const EditLookingForEvent.init(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchSpecializationBloc()
            ..add(
              SearchSpecializationEvent.fetch(),
            ),
        ),
      ],
      child: BlocListener<EditLookingForBloc, EditLookingForState>(
        listener: (context, state) {
          if (state.status == EditLookingForStatus.saved) {
            UiMessageService.showInfo(
              'Updated',
            );
            context.pop();
          } else if (state.status == EditLookingForStatus.failed) {
            UiMessageService.showError(
              state.errorMessage,
            );
          }
        },
        child: BuildAnimatedBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: colorScheme.onPrimary,
                ),
                onPressed: () => context.pop(),
              ),
              title: Text(
                'Edit Looking For',
                style: textTheme.bold17.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              actions: [
                BlocBuilder<EditLookingForBloc, EditLookingForState>(
                  builder: (context, state) {
                    final isSaving =
                        state.status == EditLookingForStatus.saving;
                    final canSave =
                        state.status == EditLookingForStatus.loaded &&
                        state.selectedSpecializations.isNotEmpty;

                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ActionBtn(
                        onPressed: canSave && !isSaving
                            ? () => _onSave(context)
                            : null,
                        child: isSaving
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.black.value,
                                ),
                              )
                            : Text(
                                'Save',
                                style: textTheme.bold14.copyWith(
                                  color: canSave
                                      ? AppColors.black.value
                                      : colorScheme.secondary,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<EditLookingForBloc, EditLookingForState>(
              builder: (context, editState) {
                if (editState.status == EditLookingForStatus.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (editState.status == EditLookingForStatus.failed) {
                  return Center(
                    child: Text(
                      'Failed to load data',
                      style: textTheme.regular14.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  );
                }

                return BlocBuilder<
                  SearchSpecializationBloc,
                  SearchSpecializationState
                >(
                  builder: (context, searchState) {
                    final specializations = searchState.specializations;

                    return HorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: OnboardSurveyHeader(
                              title: 'Who are you looking for?',
                              description:
                                  'Select specializations you want to find',
                            ),
                          ),
                          Gap(20.0),
                          SearchInput(
                            onChanged: (query) =>
                                _onSearchSpecialization(context, query),
                            hintText: 'Search specializations...',
                          ),
                          Gap(20.0),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Gap(20.0),
                              itemBuilder: (BuildContext context, int index) {
                                final specialization = specializations[index];
                                final isSelected = editState
                                    .selectedSpecializations
                                    .contains(
                                      specialization.specialization,
                                    );

                                return SurveyCard(
                                  isSelected: isSelected,
                                  colors: specialization.colors,
                                  icon: specialization.icon,
                                  title: specialization.name,
                                  description: specialization.particulars.join(
                                    ', ',
                                  ),
                                  onTap: () => _onToggleSpecialization(
                                    context,
                                    specialization.specialization,
                                  ),
                                  onLongPress: (renderBox) {},
                                );
                              },
                              itemCount: specializations.length,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
