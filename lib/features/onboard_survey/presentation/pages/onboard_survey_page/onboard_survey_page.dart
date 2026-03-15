import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/widgets/btn/custom_back_btn.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../auth/domain/repostories/i_auth_repository.dart';

import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../../user/domain/usecases/update_user_profiler_use_case.dart';
import '../../../domain/models/experience/experience.dart';
import '../../../domain/models/role/role.dart';
import '../../../domain/models/specialization/specialization.dart';
import '../../../domain/models/user_profiler/user_profiler.dart';
import '../../../domain/repositories/i_onboard_survey_repository.dart';
import '../../../domain/use_cases/get_completion_status_use_case.dart';
import '../../bloc/onboard_bloc/onboard_bloc.dart';
import 'bloc/onboard_survey_page_cubit/onboard_survey_page_cubit.dart';
import 'overlays/active_community_overlay/active_community_overlay.dart';
import 'overlays/perfect_choice_overlay/perfect_choice_overlay.dart';
import 'overlays/processing_overlay/processing_overlay.dart';
import 'stages/experience_stage/experience_stage.dart';
import 'stages/goal_stage/goal_stage.dart';
import 'stages/role_stage/role_stage.dart';
import 'stages/specialization_stage/specialization_stage.dart';
import 'widgets/build_onboard_stepper.dart';

class OnboardSurveyPage extends StatefulWidget {
  const OnboardSurveyPage({super.key});

  @override
  State<OnboardSurveyPage> createState() => _OnboardSurveyPageState();
}

class _OnboardSurveyPageState extends State<OnboardSurveyPage>
    with SingleTickerProviderStateMixin {
  late final OnboardSurveyPageCubit _onboardSurveyPageCubit;
  final PageController pageController = PageController();
  OverlayEntry? overlayEntry;

  ERole? _selectedRole;
  Specialization? _selectedSpecialization;
  EExperience? _selectedExperience;
  final List<ESpecialization> _searchingSpecializations = [];

  @override
  void initState() {
    _onboardSurveyPageCubit = OnboardSurveyPageCubit(
      updateUserProfilerUseCase: getIt<UpdateUserProfilerUseCase>(),
      getCompletionStatusUseCase: getIt<GetCompletionStatusUseCase>(),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final hasSaved = await _onboardSurveyPageCubit.hasSavedResults();
        if (hasSaved && mounted) {
          DiscoveryPageRoute().go(
            context,
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    super.dispose();
  }

  Future<void> onNextStep() async {
    if (overlayEntry != null) return;
    await _showOverlay(
      PerfectChoiceOverlay(),
    );
    _onboardSurveyPageCubit.goNext();

    pageController.nextPage(
      duration: Duration(
        milliseconds: 400,
      ),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _showOverlay(Widget entry) async {
    if (overlayEntry != null) _clearOverlay();

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => entry,
    );
    Overlay.of(context).insert(
      overlayEntry!,
    );
    await Future.delayed(Duration(seconds: 5));
    _clearOverlay();
  }

  Future<void> _showActiveCommunityOverlay(RenderBox renderBox) async {
    final Offset offset = renderBox.localToGlobal(
      Offset.zero,
    );
    return _showOverlay(
      ActiveCommunityOverlay(
        countLookingPartners: 12847,
        offset: Offset(
          offset.dx,
          offset.dy - renderBox.size.height,
        ),
      ),
    );
  }

  void onSelectRole(
    ERole role,
  ) => setState(
    () => _selectedRole = role,
  );

  void _onSelectSpecialization(
    Specialization specialization,
  ) => setState(
    () => _selectedSpecialization = specialization,
  );

  void _onSelectExperience(
    EExperience experience,
  ) => setState(
    () => _selectedExperience = experience,
  );

  void _onToggleSearchingSpecialization(
    ESpecialization specialization,
  ) => setState(
    () =>
        _searchingSpecializations.contains(
          specialization,
        )
        ? _searchingSpecializations.remove(
            specialization,
          )
        : _searchingSpecializations.add(
            specialization,
          ),
  );

  void _clearOverlay() {
    if (!mounted) return;
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void onPageChanged(
    int index,
  ) {
    _onboardSurveyPageCubit.goTo(
      page: index,
    );
  }

  void skipForNow() {}

  void onContinue() {
    if (overlayEntry != null) _clearOverlay();

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ProcessingOverlay(),
    );
    Overlay.of(context).insert(
      overlayEntry!,
    );
    Future.delayed(Duration(seconds: 10)).then(
      (_) {
        _clearOverlay();
      },
    );
  }

  void onSpecializationQueryChanged(String query) {}

  void _onLongPressedSpecialization(
    RenderBox renderBox,
    Specialization specialization,
  ) {}

  Future<void> _onCompleteGoal() async {
    _onboardSurveyPageCubit.saveResults(
      userProfiler: UserProfiler(
        specialization: _selectedSpecialization!.specialization,
        role: _selectedRole!,
        experience: _selectedExperience!,
        searchingSpecializations: _searchingSpecializations,
        skills: [],
      ),
    );
    context.read<OnboardBloc>().add(
      OnboardEvent.update(
        completeSpecialization: true,
      ),
    );
    if (mounted) {
      OnboardAboutYouPageRoute().go(
        context,
      );
    }
  }

  void _skipForNow() {}

  void _onTapBack() {
    _onboardSurveyPageCubit.goPrevious();
    pageController.previousPage(
      duration: Duration(
        milliseconds: 400,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardSurveyPageCubit>.value(
      value: _onboardSurveyPageCubit,
      child: BuildAnimatedBackground(
        child: BlocBuilder<OnboardSurveyPageCubit, OnboardSurveyPageState>(
          builder: (context, state) {
            return Stack(
              children: [
                if (state.status == OnboardSurveyPageStatus.loading)
                  LoadingDataWidget(),

                if (state.status == OnboardSurveyPageStatus.initial)
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      // leading: null,
                      leadingWidth: 80.0,
                      leading: state.step >= 2
                          ? HorizontalPadding(
                              child: CustomBackBtn(
                                onTap: _onTapBack,
                              ),
                            )
                          : null,
                    ),
                    body: HorizontalPadding(
                      child: Column(
                        children: [
                          BuildOnboardStepper(
                            step: state.step,
                          ),
                          Gap(30.0),
                          Expanded(
                            child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              pageSnapping: false,
                              controller: pageController,
                              onPageChanged: onPageChanged,
                              children: [
                                RoleStage(
                                  onTap: onSelectRole,
                                  selectedRole: _selectedRole,
                                  onLongPress: _showActiveCommunityOverlay,
                                  onTapContinue: _selectedRole != null
                                      ? onNextStep
                                      : null,
                                  skipForNow: _skipForNow,
                                ),
                                SpecializationStage(
                                  onSpecializationChanged:
                                      onSpecializationQueryChanged,
                                  selectedSpecialization:
                                      _selectedSpecialization,
                                  onSelectSpecialization:
                                      _onSelectSpecialization,
                                  onLongPressed: _onLongPressedSpecialization,
                                  onTapContinue: _selectedSpecialization != null
                                      ? onNextStep
                                      : null,
                                  skipForNow: _skipForNow,
                                ),
                                ExperienceStage(
                                  onSelectExperience: _onSelectExperience,
                                  selectedExperience: _selectedExperience,
                                  onTapContinue: _selectedExperience != null
                                      ? onNextStep
                                      : null,
                                  skipForNow: _skipForNow,
                                ),

                                GoalStage(
                                  onToggleSearchingSpecialization:
                                      _onToggleSearchingSpecialization,
                                  selectedSearchingSpecializations:
                                      _searchingSpecializations,
                                  onCompleteGoal:
                                      _searchingSpecializations.isEmpty
                                      ? null
                                      : () => _onCompleteGoal(),
                                ),
                              ],
                            ),
                          ),
                          Gap(
                            MediaQuery.of(context).viewPadding.bottom,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
