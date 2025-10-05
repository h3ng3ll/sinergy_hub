import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/app_shader.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/utils/shader_painter.dart';
import '../../../../../core/widgets/btn/custom_back_btn.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../doman/models/experience/experience.dart';
import '../../../doman/models/role/role.dart';
import '../../../doman/models/specialization/specialization.dart';
import '../../../doman/models/user_profiler/user_profiler.dart';
import '../../../doman/repositories/i_onboard_survey_repository.dart';
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
  late AnimationController _animation;

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
      onboardSurveyRepository: getIt<IOnboardSurveyRepository>(),
      authRepository: getIt<IAuthRepository>(),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final hasSaved = await _onboardSurveyPageCubit.hasSavedResults();
        if (hasSaved && mounted) {
          HomePageRoute().go(
            context,
          );
        }
      },
    );

    _animation =
        AnimationController(
            vsync: this,
            duration: Duration(
              seconds: 2,
            ),
          )
          ..repeat(
            reverse: true,
          )
          ..addListener(
            () => setState(() {}),
          );
    super.initState();
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    _animation.dispose();
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
      ),
    );
    if (mounted) {
      HomePageRoute().go(
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
      child: ShaderBuilder(
        assetKey: AppShaders.ve,
        (context, shader, child) {
          return CustomPaint(
            painter: ShaderPainter(
              repaint: _animation,
              shader: shader,
              parameters: [
                ShaderType(
                  shaderType: EShaderDataType.floatShader,
                  value: _animation.lastElapsedDuration!.inMilliseconds / 1000,
                ),
                ShaderType(
                  shaderType: EShaderDataType.floatShader,
                  value: MediaQuery.of(context).size.width,
                ),
                ShaderType(
                  shaderType: EShaderDataType.floatShader,
                  value: MediaQuery.of(context).size.height,
                ),
              ],
            ),
            child: child,
          );
        },
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
