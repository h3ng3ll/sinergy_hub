import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../user/domain/usecases/get_current_user_data_use_case.dart';
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
                backgroundColor: Colors.transparent,
                body: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          if (state.status == MatchResultStatus.failed) {
            return AnimatedGradientBackground(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Text(
                    'Error: ${state.errorMessage}',
                    style: textTheme.medium16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }

          if (state.match == null) {
            return AnimatedGradientBackground(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: const Center(
                  child: Text(
                    'No match data',
                    style: TextStyle(color: Colors.white),
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

          return AnimatedGradientBackground(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      // User Avatars Row
                      _buildAvatarsRow(
                        context,
                        match.user.avatarUrl ?? '',
                        match.user.avatarUrl ?? '',
                      ),
                      const Gap(40),
                      // Match Title
                      Text(
                        'You + ${match.user.firstName}',
                        style: textTheme.bold24.copyWith(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(12),
                      Text(
                        'Perfect Co-founder Match!',
                        style: textTheme.medium16.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(24),
                      // Role Badges
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildRoleBadge(
                            match.user.profiler.role.name,
                            colorScheme,
                            textTheme,
                          ),
                          const Gap(12),
                          Icon(
                            Icons.add,
                            color: Colors.white.withValues(alpha: 0.8),
                            size: 20,
                          ),
                          const Gap(12),
                          _buildRoleBadge(
                            match.user.profiler.role.name,
                            colorScheme,
                            textTheme,
                          ),
                        ],
                      ),
                      const Gap(60),
                      // Compatibility Score Card
                      _buildCompatibilityCard(
                        compatibilityScore,
                        skillsMatch,
                        visionAlign,
                        experienceScore,
                        colorScheme,
                        textTheme,
                      ),
                      const Spacer(),
                      // Action Buttons
                      _buildActionButtons(context, colorScheme, textTheme),
                      const Gap(32),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatarsRow(
    BuildContext context,
    String currentUserAvatar,
    String matchedUserAvatar,
  ) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAvatar(currentUserAvatar, true),
            const Gap(100),
            _buildAvatar(matchedUserAvatar, false),
          ],
        ),
        // Heart Icon in the middle
        Positioned(
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String avatarUrl, bool isCurrentUser) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            image: avatarUrl.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(avatarUrl),
                    fit: BoxFit.cover,
                  )
                : null,
            color: avatarUrl.isEmpty ? Colors.grey[300] : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.green : Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Icon(
              isCurrentUser ? Icons.check : Icons.code,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleBadge(
    String role,
    AppColorScheme colorScheme,
    AppTextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        role,
        style: textTheme.medium14.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCompatibilityCard(
    int compatibilityScore,
    int skillsMatch,
    int visionAlign,
    int experienceScore,
    AppColorScheme colorScheme,
    AppTextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            '$compatibilityScore%',
            style: textTheme.bold24.copyWith(
              color: const Color(0xFFFFD700),
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(8),
          Text(
            'Compatibility Score',
            style: textTheme.medium16.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 18,
            ),
          ),
          const Gap(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildScoreItem(
                '$skillsMatch/10',
                'Skills Match',
                const Color(0xFF4ECCA3),
                textTheme,
              ),
              _buildScoreItem(
                '$visionAlign/10',
                'Vision Align',
                const Color(0xFF5DADE2),
                textTheme,
              ),
              _buildScoreItem(
                '$experienceScore/10',
                'Experience',
                const Color(0xFFBB86FC),
                textTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem(
    String score,
    String label,
    Color color,
    AppTextTheme textTheme,
  ) {
    return Column(
      children: [
        Text(
          score,
          style: textTheme.bold20.copyWith(
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(4),
        Text(
          label,
          style: textTheme.regular12.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    AppColorScheme colorScheme,
    AppTextTheme textTheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Keep Swiping',
              style: textTheme.bold16.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigate to chat or profile
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Start Chat',
              style: textTheme.bold16.copyWith(
                color: const Color(0xFFF27361),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
