import 'dart:math' show min;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../onboard_survey/domain/models/specializations/specializations.dart';
import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../domain/usecases/find_match_chat_id_use_case.dart';
import '../../../domain/usecases/get_match_by_id_use_case.dart';
import '../../../domain/usecases/mark_as_notified_match_use_case.dart';
import '../../bloc/match_result_bloc/match_result_bloc.dart';
import '../discovery_page/widgets/build_has_match/widgets/build_match_avatar.dart';
import 'widgets/animated_gradient_background.dart';
import 'widgets/build_avatars_row.dart';
import 'widgets/build_heart.dart';

/// Max width of the two-column result layout on desktop.
const double _kDesktopMaxWidth = 1100.0;

/// Gap between the two desktop columns.
const double _kDesktopColumnGap = 56.0;

class MatchResultPage extends StatefulWidget {
  final String matchId;

  const MatchResultPage({
    super.key,
    required this.matchId,
  });

  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  late final MatchResultBloc _matchResultBloc;

  @override
  void initState() {
    super.initState();
    _matchResultBloc =
        MatchResultBloc(
          getMatchByIdUseCase: getIt<GetMatchByIdUseCase>(),
          getCurrentUserDataUseCase: getIt<GetCurrentUserDataUseCase>(),
          markAsNotifiedMatchUseCase: getIt<MarkAsNotifiedMatchUseCase>(),
          lookForMatchesUseCase: getIt<FindMatchChatIdUseCase>(),
        )..add(
          MatchResultEvent.getResult(
            matchId: widget.matchId,
          ),
        );
  }

  @override
  void dispose() {
    _matchResultBloc.close();
    super.dispose();
  }

  void onStartChat(BuildContext context) {
    ChatPageRoute(
      chatId: _matchResultBloc.state.chatId,
    ).replace(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BlocProvider.value(
      value: _matchResultBloc,
      child: BlocBuilder<MatchResultBloc, MatchResultState>(
        builder: (context, state) {
          if (state.status == MatchResultStatus.loading) {
            return AnimatedGradientBackground(
              child: Scaffold(
                backgroundColor: AppColors.transparent.value,
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white.value,
                  ),
                ),
              ),
            );
          }

          if (state.status == MatchResultStatus.failed) {
            return AnimatedGradientBackground(
              child: Scaffold(
                backgroundColor: AppColors.transparent.value,
                body: Center(
                  child: Text(
                    'Error: ${state.errorMessage}',
                    style: textTheme.medium16.copyWith(
                      color: AppColors.white.value,
                    ),
                  ),
                ),
              ),
            );
          }

          if (state.match == null) {
            return AnimatedGradientBackground(
              child: Scaffold(
                backgroundColor: AppColors.transparent.value,
                body: Center(
                  child: Text(
                    'No match data',
                    style: TextStyle(color: AppColors.white.value),
                  ),
                ),
              ),
            );
          }

          final match = state.match!;
          // Calculate compatibility score
          final skillsMatch = match.skillsMatch ?? 0;
          final visionAlign = match.align ?? 0;
          final experienceScore = match.experienceScore ?? 0;
          final total = skillsMatch + visionAlign + experienceScore;
          final compatibilityScore = ((total / 30) * 100).round();

          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;

              // Calculate responsive values
              final pagePadding = ResponsiveHelper.responsivePadding(
                screenWidth,
                24.0,
              );
              final maxContentWidth = ResponsiveHelper.maxContentWidth(
                screenWidth,
              );

              /// Every size below scales with [screenWidth]. On desktop the
              /// content is split into two columns, so it is sized from the
              /// column width instead — otherwise it overflows its column.
              List<Widget> buildHero(double screenWidth) => <Widget>[
                BuildAvatarsRow(
                  matchedUser: match.user,
                  currentUser: state.user,
                  screenWidth: screenWidth,
                ),
                Gap(
                  ResponsiveHelper.responsiveSpacing(
                    screenWidth,
                    40.0,
                  ),
                ),
                Text(
                  AppLocalizations.of(
                    context,
                  )!.match_result_title(match.user.firstName ?? ''),
                  style: textTheme.bold24.copyWith(
                    color: AppColors.white.value,
                    fontSize: ResponsiveHelper.responsiveFontSize(
                      screenWidth,
                      32.0,
                      maxFontSize: 48,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(
                  ResponsiveHelper.responsiveSpacing(
                    screenWidth,
                    12.0,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.match_result_subtitle,
                  style: textTheme.medium16.copyWith(
                    color: AppColors.white.value.withValues(
                      alpha: 0.9,
                    ),
                    fontSize: ResponsiveHelper.responsiveFontSize(
                      screenWidth,
                      18.0,
                      maxFontSize: 24,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(
                  ResponsiveHelper.responsiveSpacing(
                    screenWidth,
                    24.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: _buildRoleBadge(
                        Specializations.get(
                          match.user.profiler.specialization,
                        ).name,
                        screenWidth,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.responsiveSpacing(
                          screenWidth,
                          12.0,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.white.value.withValues(alpha: 0.8),
                        size: ResponsiveHelper.responsiveIconSize(
                          screenWidth,
                          20.0,
                          maxSize: 28,
                        ),
                      ),
                    ),
                    Flexible(
                      child: _buildRoleBadge(
                        state.user != null
                            ? Specializations.get(
                                state.user!.profiler.specialization,
                              ).name
                            : '',
                        screenWidth,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                  ],
                ),
              ];
              Widget buildScoreCard(double screenWidth) =>
                  _buildCompatibilityCard(
                    screenWidth,
                    compatibilityScore,
                    skillsMatch,
                    visionAlign,
                    experienceScore,
                    colorScheme,
                    textTheme,
                  );
              Widget buildActionButtons(double screenWidth) =>
                  _buildActionButtons(
                    context,
                    screenWidth,
                    colorScheme,
                    textTheme,
                  );

              /// Desktop: side-by-side so the whole result fits the
              /// viewport instead of one tall column running off-screen.
              if (ResponsiveHelper.isDesktop(screenWidth)) {
                final rowWidth = min(
                  screenWidth - pagePadding * 2,
                  _kDesktopMaxWidth,
                );
                final columnWidth = (rowWidth - _kDesktopColumnGap) / 2;

                return AnimatedGradientBackground(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SafeArea(
                      child: Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: pagePadding,
                            vertical: 24.0,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: _kDesktopMaxWidth,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: _kDesktopColumnGap,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: buildHero(columnWidth),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 32.0,
                                    children: [
                                      buildScoreCard(columnWidth),
                                      buildActionButtons(columnWidth),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return AnimatedGradientBackground(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: pagePadding,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: maxContentWidth,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 24.0,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  ...buildHero(screenWidth),
                                  Gap(
                                    ResponsiveHelper.responsiveSpacing(
                                      screenWidth,
                                      60.0,
                                      maxSpacing: 80,
                                    ),
                                  ),
                                  buildScoreCard(screenWidth),
                                  Gap(
                                    ResponsiveHelper.responsiveSpacing(
                                      screenWidth,
                                      32.0,
                                      maxSpacing: 48,
                                    ),
                                  ),
                                  buildActionButtons(screenWidth),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildRoleBadge(
    String role,
    double screenWidth,
    AppColorScheme colorScheme,
    AppTextTheme textTheme,
  ) {
    final horizontalPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      20.0,
      maxPadding: 32,
    );
    final verticalPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      10.0,
      maxPadding: 16,
    );
    final borderRadius = ResponsiveHelper.responsiveBorderRadius(
      screenWidth,
      20.0,
      maxRadius: 30,
    );

    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.35,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.value.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: AutoSizeText(
        role,
        style: textTheme.medium14.copyWith(
          color: AppColors.white.value,
          fontSize: ResponsiveHelper.responsiveFontSize(
            screenWidth,
            14.0,
            maxFontSize: 20,
          ),
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _buildCompatibilityCard(
    double screenWidth,
    int compatibilityScore,
    int skillsMatch,
    int visionAlign,
    int experienceScore,
    AppColorScheme colorScheme,
    AppTextTheme textTheme,
  ) {
    final cardPadding = ResponsiveHelper.responsivePadding(
      screenWidth,
      32.0,
      maxPadding: 48,
    );
    final cardBorderRadius = ResponsiveHelper.responsiveBorderRadius(
      screenWidth,
      24.0,
      maxRadius: 36,
    );

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: AppColors.white.value.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      child: Column(
        children: [
          Text(
            '$compatibilityScore%',
            style: textTheme.bold24.copyWith(
              color: AppColors.gold.value,
              fontSize: ResponsiveHelper.responsiveFontSize(
                screenWidth,
                64.0,
                maxFontSize: 96,
              ),
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(
            ResponsiveHelper.responsiveSpacing(
              screenWidth,
              8.0,
              maxSpacing: 12,
            ),
          ),
          Text(
            'Compatibility Score',
            style: textTheme.medium16.copyWith(
              color: AppColors.white.value.withValues(alpha: 0.9),
              fontSize: ResponsiveHelper.responsiveFontSize(
                screenWidth,
                18.0,
                maxFontSize: 24,
              ),
            ),
          ),
          Gap(
            ResponsiveHelper.responsiveSpacing(
              screenWidth,
              32.0,
              maxSpacing: 48,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              _buildScoreItem(
                screenWidth,
                '$skillsMatch/10',
                'Skills Match',
                AppColors.skillsMatchGreen.value,
                textTheme,
              ),
              _buildScoreItem(
                screenWidth,
                '$visionAlign/10',
                'Vision Align',
                AppColors.visionAlignBlue.value,
                textTheme,
              ),
              _buildScoreItem(
                screenWidth,
                '$experienceScore/10',
                'Experience',
                AppColors.experiencePurple.value,
                textTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem(
    double screenWidth,
    String score,
    String label,
    Color color,
    AppTextTheme textTheme,
  ) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              score,
              style: textTheme.bold20.copyWith(
                color: color,
                fontSize: ResponsiveHelper.responsiveFontSize(
                  screenWidth,
                  28.0,
                  maxFontSize: 42,
                ),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(
            ResponsiveHelper.responsiveSpacing(
              screenWidth,
              4.0,
              maxSpacing: 8,
            ),
          ),
          Text(
            label,
            style: textTheme.regular12.copyWith(
              color: AppColors.white.value.withValues(alpha: 0.8),
              fontSize: ResponsiveHelper.responsiveFontSize(
                screenWidth,
                13.0,
                maxFontSize: 18,
              ),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    double screenWidth,
    AppColorScheme colorScheme,
    AppTextTheme textTheme,
  ) {
    final buttonHeight = ResponsiveHelper.responsiveButtonHeight(
      screenWidth,
      56.0, // Base height for mobile
      maxHeight: 72,
    );
    final buttonBorderRadius = ResponsiveHelper.responsiveBorderRadius(
      screenWidth,
      12.0,
      maxRadius: 18,
    );
    final buttonSideWidth = ResponsiveHelper.responsiveSpacing(
      screenWidth,
      2.0,
      maxSpacing: 4,
    );

    return Row(
      spacing: ResponsiveHelper.responsiveSpacing(
        screenWidth,
        16.0,
        maxSpacing: 24,
      ),
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              minimumSize: Size.fromHeight(buttonHeight),
              padding: EdgeInsets.symmetric(
                vertical: ResponsiveHelper.responsivePadding(
                  screenWidth,
                  16.0,
                  maxPadding: 20,
                ),
              ),
              side: BorderSide(
                color: AppColors.white.value,
                width: buttonSideWidth,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonBorderRadius),
              ),
            ),
            child: Text(
              'Keep Swiping',
              style: textTheme.bold16.copyWith(
                color: AppColors.white.value,
                fontSize: ResponsiveHelper.responsiveFontSize(
                  screenWidth,
                  16.0,
                  maxFontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () => onStartChat(context),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(buttonHeight),
              padding: EdgeInsets.symmetric(
                vertical: ResponsiveHelper.responsivePadding(
                  screenWidth,
                  16.0,
                  maxPadding: 20,
                ),
              ),
              backgroundColor: AppColors.white.value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonBorderRadius),
              ),
            ),
            child: Text(
              'Start Chat',
              style: textTheme.bold16.copyWith(
                color: AppColors.startChatOrange.value,
                fontSize: ResponsiveHelper.responsiveFontSize(
                  screenWidth,
                  16.0,
                  maxFontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
