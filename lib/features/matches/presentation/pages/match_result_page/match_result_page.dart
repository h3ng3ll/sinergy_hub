import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
import '../../../domain/usecases/find_match_chat_id_use_case.dart';
import '../../../domain/usecases/get_match_by_id_use_case.dart';
import '../../../domain/usecases/mark_as_notified_match_use_case.dart';
import '../../bloc/match_result_bloc/match_result_bloc.dart';
import 'widgets/animated_gradient_background.dart';

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
                              padding: const EdgeInsets.symmetric(vertical: 24.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  // User Avatars Row
                                  _buildAvatarsRow(
                                    context,
                                    screenWidth,
                                    match.user.avatarUrl ?? '',
                                    state.user?.avatarUrl ?? '',
                                  ),
                                  Gap(
                                    ResponsiveHelper.responsiveSpacing(
                                      screenWidth,
                                      40.0,
                                    ),
                                  ),
                                  // Match Title
                                  Text(
                                    'You + ${match.user.firstName}',
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
                                    'Perfect Co-founder Match!',
                                    style: textTheme.medium16.copyWith(
                                      color: AppColors.white.value.withValues(alpha: 0.9),
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
                                  // Role Badges
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: _buildRoleBadge(
                                          match.user.profiler.role.name,
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
                                          match.user.profiler.role.name,
                                          screenWidth,
                                          colorScheme,
                                          textTheme,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(
                                    ResponsiveHelper.responsiveSpacing(
                                      screenWidth,
                                      60.0,
                                      maxSpacing: 80,
                                    ),
                                  ),
                                  // Compatibility Score Card
                                  _buildCompatibilityCard(
                                    screenWidth,
                                    compatibilityScore,
                                    skillsMatch,
                                    visionAlign,
                                    experienceScore,
                                    colorScheme,
                                    textTheme,
                                  ),
                                  Gap(
                                    ResponsiveHelper.responsiveSpacing(
                                      screenWidth,
                                      32.0,
                                      maxSpacing: 48,
                                    ),
                                  ),
                                  // Action Buttons
                                  _buildActionButtons(
                                    context,
                                    screenWidth,
                                    colorScheme,
                                    textTheme,
                                  ),
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

  Widget _buildAvatarsRow(
    BuildContext context,
    double screenWidth,
    String currentUserAvatar,
    String matchedUserAvatar,
  ) {
    final avatarSize = ResponsiveHelper.responsiveAvatarSize(
      screenWidth,
      110.0,
      maxSize: 160,
    );
    final heartSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      56.0,
      maxSize: 80,
    );
    final heartIconSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      32.0,
      maxSize: 48,
    );
    final statusBadgeSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      36.0,
      maxSize: 52,
    );
    final statusIconSize = ResponsiveHelper.responsiveIconSize(
      screenWidth,
      18.0,
      maxSize: 26,
    );
    final stackGap = ResponsiveHelper.responsiveSpacing(
      screenWidth,
      100.0,
      maxSpacing: 140,
    );

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAvatar(
              currentUserAvatar,
              true,
              avatarSize,
              statusBadgeSize,
              statusIconSize,
            ),
            Gap(stackGap),
            _buildAvatar(
              matchedUserAvatar,
              false,
              avatarSize,
              statusBadgeSize,
              statusIconSize,
            ),
          ],
        ),
        // Heart Icon in the middle
        Positioned(
          child: Container(
            width: heartSize,
            height: heartSize,
            decoration: BoxDecoration(
              color: AppColors.heartRed.value.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite,
              color: AppColors.white.value,
              size: heartIconSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(
    String avatarUrl,
    bool isCurrentUser,
    double avatarSize,
    double statusBadgeSize,
    double statusIconSize,
  ) {
    final borderWidth = ResponsiveHelper.responsiveSpacing(
      avatarSize,
      4.0,
    );
    final badgeBorderWidth = ResponsiveHelper.responsiveSpacing(
      avatarSize,
      3.0,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.white.value,
              width: borderWidth,
            ),
            image: avatarUrl.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(avatarUrl),
                    fit: BoxFit.cover,
                  )
                : null,
            color: avatarUrl.isEmpty ? AppColors.greyLight.value : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: statusBadgeSize,
            height: statusBadgeSize,
            decoration: BoxDecoration(
              color: isCurrentUser ? AppColors.statusGreen.value : AppColors.statusBlue.value,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.value,
                width: badgeBorderWidth,
              ),
            ),
            child: Icon(
              isCurrentUser ? Icons.check : Icons.code,
              color: Colors.white,
              size: statusIconSize,
            ),
          ),
        ),
      ],
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
      child: Text(
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
        maxLines: 2,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
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
