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
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/specialization_stage/widgets/specialization_list.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/onboard_survey_header.dart';
import 'bloc/edit_specialization_bloc.dart';

class EditSpecializationPage extends StatelessWidget {
  const EditSpecializationPage({super.key});

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

  void _onSelectSpecialization(
    BuildContext context,
    Specialization specialization,
  ) {
    context.read<EditSpecializationBloc>().add(
      EditSpecializationEvent.select(
        specialization: specialization.specialization,
      ),
    );
  }

  void _onSave(BuildContext context) {
    context.read<EditSpecializationBloc>().add(
      const EditSpecializationEvent.save(),
    );
  }

  void _onStateChanged(
    BuildContext context,
    EditSpecializationState state,
  ) {
    if (state.isSaved) {
      UiMessageService.showInfo(
        'Updated',
      );
      context.pop();
    } else if (state.isFailed) {
      UiMessageService.showError(
        state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<EditSpecializationBloc>()
            ..add(
              const EditSpecializationEvent.init(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchSpecializationBloc()
            ..add(
              SearchSpecializationEvent.fetch(),
            ),
        ),
      ],
      child: BlocListener<EditSpecializationBloc, EditSpecializationState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: _onStateChanged,
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
                'Edit Specialization',
                style: textTheme.bold17.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              actions: [
                BlocBuilder<EditSpecializationBloc, EditSpecializationState>(
                  builder: (context, state) {
                    final canSave = !state.isSaving &&
                        !state.isLoading &&
                        state.hasChanges;

                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ActionBtn(
                        onPressed: canSave ? () => _onSave(context) : null,
                        child: state.isSaving
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
            body: BlocBuilder<EditSpecializationBloc, EditSpecializationState>(
              builder: (context, editState) {
                if (editState.isInitial || editState.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (editState.userData == null) {
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
                    return HorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: OnboardSurveyHeader(
                              title: 'What is your specific specialization?',
                              description:
                                  'Help us find your perfect co-founder match',
                            ),
                          ),
                          Gap(20.0),
                          SearchInput(
                            onChanged: (query) =>
                                _onSearchSpecialization(context, query),
                            hintText: 'Search your specialization...',
                          ),
                          Expanded(
                            child: SpecializationList(
                              specializations: searchState.specializations,
                              isSelected: (e) =>
                                  e.specialization ==
                                  editState.selectedSpecialization,
                              onSelect: (e) =>
                                  _onSelectSpecialization(context, e),
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
