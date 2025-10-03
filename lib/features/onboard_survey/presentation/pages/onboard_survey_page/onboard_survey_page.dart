import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../core/resources/app_shader.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/utils/shader_painter.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../doman/models/experience/experience.dart';
import '../../../doman/models/role/role.dart';
import '../../../doman/models/specialization/specialization.dart';
import '../bloc/onboard_survey_page_bloc/onboard_survey_page_bloc.dart';
import 'overlays/active_community_overlay/active_community_overlay.dart';
import 'overlays/processing_overlay/processing_overlay.dart';
import 'stages/experience_stage/experience_stage.dart';
import 'stages/goal_stage/goal_stage.dart';
import 'stages/role_stage/role_stage.dart';
import 'stages/specialization_stage/specialization_stage.dart';
import 'widgets/build_onboard_bottom_actions.dart';

class OnboardSurveyPage extends StatefulWidget {
  const OnboardSurveyPage({super.key});

  @override
  State<OnboardSurveyPage> createState() => _OnboardSurveyPageState();
}

class _OnboardSurveyPageState extends State<OnboardSurveyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;

  late final OnboardSurveyPageBloc onboardSurveyPageBloc;
  final PageController pageController = PageController();
  OverlayEntry? overlayEntry;

  ERole? _selectedRole;
  Specialization? _selectedSpecialization;
  EExperience? _selectedExperience;

  @override
  void initState() {
    onboardSurveyPageBloc = OnboardSurveyPageBloc();
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

  void onNextStep() {}

  void onLongPressed(RenderBox renderBox) {
    final Offset offset = renderBox.localToGlobal(
      Offset.zero,
    );

    if (overlayEntry != null) _clearOverlay();

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ActiveCommunityOverlay(
        countLookingPartners: 12847,
        offset: Offset(
          offset.dx,
          offset.dy - renderBox.size.height,
        ),
      ),
    );
    Overlay.of(context).insert(
      overlayEntry!,
    );
    Future.delayed(Duration(seconds: 5)).then(
      (_) {
        _clearOverlay();
      },
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

  void _clearOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void onPageChanged(
    int index,
  ) {
    onboardSurveyPageBloc.add(
      OnboardSurveyPageEvent.goTo(
        page: index,
      ),
    );
    // final surveyBloc = onboardSurveyPageBloc.state;
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardSurveyPageBloc>.value(
      value: onboardSurveyPageBloc,
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: HorizontalPadding(
            child: BlocBuilder<OnboardSurveyPageBloc, OnboardSurveyPageState>(
              builder: (context, state) {
                final surveyBloc = context.watch<OnboardSurveyPageBloc>();
                final colorScheme = AppColorScheme.of(context);
                final textTheme = AppTextTheme.of(context);
                return Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Step ${surveyBloc.state.step} of 4',
                                    style: textTheme.regular12.copyWith(
                                      color: colorScheme.secondary,
                                    ),
                                  ),
                                  Text(
                                    '${surveyBloc.state.step * 25}%',
                                    style: textTheme.regular14.copyWith(
                                      color: colorScheme.secondary,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(10.0),
                              StepProgressIndicator(
                                totalSteps: 4,
                                size: 10,
                                currentStep: surveyBloc.state.step,
                                selectedGradientColor: LinearGradient(
                                  colors: [
                                    AppColors.buttonBlue.value,
                                    AppColors.darkOrchid.value,
                                  ],
                                ),
                                roundedEdges: Radius.circular(
                                  12.5,
                                ),

                                unselectedColor: AppColors.white.value
                                    .withValues(
                                      alpha: 0.3,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Gap(30.0),
                    Expanded(
                      child: PageView(
                        pageSnapping: false,
                        controller: pageController,
                        onPageChanged: onPageChanged,
                        children: [
                          RoleStage(
                            onTap: onSelectRole,
                            selectedRole: _selectedRole,
                            onLongPress: onLongPressed,
                          ),
                          SpecializationStage(
                            onSpecializationChanged:
                                onSpecializationQueryChanged,
                            selectedSpecialization: _selectedSpecialization,
                            onSelectSpecialization: _onSelectSpecialization,
                            onLongPressed: _onLongPressedSpecialization,
                          ),
                          ExperienceStage(
                            onSelectExperience: _onSelectExperience,
                            selectedExperience: _selectedExperience,
                          ),
                          GoalStage(),
                        ],
                      ),
                    ),
                    BuildOnboardBottomActions(
                      skipForNow: skipForNow,
                      onPressed: _selectedRole == null ? null : onContinue,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
