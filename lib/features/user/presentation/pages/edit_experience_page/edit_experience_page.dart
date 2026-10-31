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
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../../onboard_survey/domain/models/experience/experience.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/stages/experience_stage/widgets/experience_grid.dart';
import '../../../../onboard_survey/presentation/pages/onboard_survey_page/widgets/onboard_survey_header.dart';
import 'bloc/edit_experience_bloc.dart';

class EditExperiencePage extends StatelessWidget {
  const EditExperiencePage({super.key});

  void _onSelectExperience(
    BuildContext context,
    EExperience experience,
  ) {
    context.read<EditExperienceBloc>().add(
      EditExperienceEvent.select(
        experience: experience,
      ),
    );
  }

  void _onSave(BuildContext context) {
    context.read<EditExperienceBloc>().add(
      const EditExperienceEvent.save(),
    );
  }

  void _onStateChanged(
    BuildContext context,
    EditExperienceState state,
  ) {
    if (state.isSaved) {
      UiMessageService.showInfo(
        AppLocalizations.of(context)!.common_updated,
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

    return BlocProvider(
      create: (context) => getIt<EditExperienceBloc>()
        ..add(
          const EditExperienceEvent.init(),
        ),
      child: BlocListener<EditExperienceBloc, EditExperienceState>(
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
                AppLocalizations.of(context)!.edit_experience_title,
                style: textTheme.bold17.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              actions: [
                BlocBuilder<EditExperienceBloc, EditExperienceState>(
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
            body: BlocBuilder<EditExperienceBloc, EditExperienceState>(
              builder: (context, state) {
                if (state.isInitial || state.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state.userData == null) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.common_failed_to_load,
                      style: textTheme.regular14.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  );
                }

                if (!ResponsiveHelper.isMobile(context)) {
                  return HorizontalPadding(
                    child: SelectionPageLayout(
                      header: OnboardSurveyHeader(
                        title: AppLocalizations.of(context)!.edit_experience_heading,
                        description:
                            AppLocalizations.of(context)!.common_cofounder_match_hint,
                      ),
                      content: ExperienceGrid(
                        selectedExperience: state.selectedExperience,
                        onSelectExperience: (experience) =>
                            _onSelectExperience(context, experience),
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
                          title: AppLocalizations.of(context)!.edit_experience_heading,
                          description:
                              AppLocalizations.of(context)!.common_cofounder_match_hint,
                        ),
                      ),
                      Gap(20.0),
                      Expanded(
                        child: ExperienceGrid(
                          selectedExperience: state.selectedExperience,
                          onSelectExperience: (experience) =>
                              _onSelectExperience(context, experience),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
