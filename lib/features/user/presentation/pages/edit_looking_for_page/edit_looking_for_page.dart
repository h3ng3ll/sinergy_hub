import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../widgets/selection_page_layout/selection_page_layout.dart';
import '../../widgets/survey_card_grid/survey_card_grid.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/bloc/search_specialization_bloc/search_specialization_bloc.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/specialization_stage/widgets/search_input.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/onboard_survey_header.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/survey_card/survey_card.dart';
import '../../bloc/skills_bloc/skills_bloc.dart';
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
          create: (context) => getIt<SkillsBloc>()
            ..add(
              const SkillsEvent.fetch(),
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
              AppLocalizations.of(context)!.common_updated,
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
                AppLocalizations.of(context)!.edit_looking_for_title,
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
                                AppLocalizations.of(context)!.common_save,
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
                      AppLocalizations.of(context)!.common_failed_to_load,
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
                    final reachLimit =
                        editState.selectedSpecializations.length >= 5;

                    Widget buildCard(BuildContext context, int index) {
                      final specialization = specializations[index];
                      final isSelected = editState.selectedSpecializations
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
                        onTap: isSelected || !reachLimit
                            ? () => _onToggleSpecialization(
                                context,
                                specialization.specialization,
                              )
                            : null,
                        onLongPress: (renderBox) {},
                      );
                    }

                    if (!ResponsiveHelper.isMobile(context)) {
                      return HorizontalPadding(
                        child: SelectionPageLayout(
                          header: OnboardSurveyHeader(
                            title: AppLocalizations.of(context)!.edit_looking_for_heading,
                            description: AppLocalizations.of(context)!.edit_looking_for_description,
                          ),
                          search: SearchInput(
                            onChanged: (query) =>
                                _onSearchSpecialization(context, query),
                            hintText: AppLocalizations.of(context)!.edit_looking_for_search_hint,
                          ),
                          content: SurveyCardGrid(
                            itemCount: specializations.length,
                            itemBuilder: buildCard,
                          ),
                        ),
                      );
                    }

                    return HorizontalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: OnboardSurveyHeader(
                              title: AppLocalizations.of(context)!.edit_looking_for_heading,
                              description: AppLocalizations.of(context)!.edit_looking_for_description,
                            ),
                          ),
                          Gap(20.0),
                          SearchInput(
                            onChanged: (query) =>
                                _onSearchSpecialization(context, query),
                            hintText: AppLocalizations.of(context)!.edit_looking_for_search_hint,
                          ),
                          Gap(20.0),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Gap(20.0),
                              itemBuilder: buildCard,
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
