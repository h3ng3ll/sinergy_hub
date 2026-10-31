import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/utils/platform_helper.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/widgets/wide/staggered_entrance.dart';
import '../../../../../core/widgets/btn/app_fab.dart';
import '../../../../../core/widgets/btn/custom_back_btn.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../bloc/user_profile_bloc/user_profile_bloc.dart';
import '../../../domain/usecases/get_user_data_use_case.dart';
import 'widgets/about_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/looking_for_section.dart';
import 'widgets/skills_section.dart';

/// Total length of the staggered section entrance.
const Duration _kEntranceDuration = Duration(milliseconds: 900);

class UserProfilePage extends StatefulWidget {
  final String userId;

  /// The chat this profile was opened from. `null` when opened from
  /// Discovery — there is no chat yet, so the chat-scoped Report is hidden.
  final String? chatId;

  const UserProfilePage({
    super.key,
    required this.userId,
    this.chatId,
  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  late final UserProfileBloc _userProfileBloc;
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: _kEntranceDuration,
  );

  @override
  void initState() {
    super.initState();
    _userProfileBloc =
        UserProfileBloc(
          getUserDataUseCase: getIt<GetUserDataUseCase>(),
        )..add(
          UserProfileEvent.initialize(userId: widget.userId),
        );
  }

  @override
  void dispose() {
    _entrance.dispose();
    _userProfileBloc.close();
    super.dispose();
  }

  /// On web the profile is opened from the chat with `.go` (no stack entry),
  /// so popping does nothing — return to the chat route instead.
  void _onBack() {
    final chatId = widget.chatId;
    if (kIsWeb && chatId != null) {
      ChatPageRoute(chatId: chatId).go(context);
      return;
    }
    context.pop();
  }

  void _onProfileLoaded(BuildContext context, UserProfileState state) {
    _entrance.forward(from: 0.0);
  }

  /// Phones keep the original, non-animated layout.
  Widget _staggered(int index, Widget child) =>
      ResponsiveHelper.isMobile(context)
      ? child
      : StaggeredEntrance(
          animation: _entrance,
          index: index,
          child: child,
        );

  void _onReport(String chatId) {
    /// Always push (even on web) so the report page keeps a stack entry and
    /// can be popped — `.navigate`/`.go` would replace the route and trap the
    /// user on the report page with no way back.
    ReportUserPageRoute(
      chatId: chatId,
      userId: widget.userId,
    ).push(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    final wide = !ResponsiveHelper.isMobile(context);

    /// Side panel of the desktop chat split view.
    final inSidePanel =
        wide &&
        widget.chatId != null &&
        !PlatformHelper.isMobile &&
        ResponsiveHelper.isDesktop(MediaQuery.sizeOf(context).width);

    return BlocProvider.value(
      value: _userProfileBloc,
      child: BlocListener<UserProfileBloc, UserProfileState>(
        listenWhen: (p, c) => p.userData == null && c.userData != null,
        listener: _onProfileLoaded,
        child: BuildAnimatedBackground(
          child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              final userData = state.userData;
              final chatId = widget.chatId;

              return Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButton: wide || userData == null || chatId == null
                    ? null
                    : AppFab(
                        onPressed: () => _onReport(chatId),
                        child: const Icon(Icons.flag_outlined),
                      ),
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                        child: inSidePanel
                            ? IconButton(
                                onPressed: _onBack,
                                tooltip: lo.common_close,
                                icon: Icon(
                                  Icons.close,
                                  color: AppColors.white.value,
                                ),
                              )
                            : CustomBackBtn(
                                onTap: _onBack,
                              ),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (state.isFailed) {
                              return Center(
                                child: HorizontalPadding(
                                  child: Text(
                                    state.errorMessage,
                                    textAlign: TextAlign.center,
                                    style: textTheme.medium16.copyWith(
                                      color: AppColors.white.value,
                                    ),
                                  ),
                                ),
                              );
                            }

                            if (userData == null) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white.value,
                                ),
                              );
                            }

                            final aboutMe = userData.aboutMe;
                            final lookingFor =
                                userData.profiler.searchingSpecializations;
                            final skills = userData.profiler.skills;

                            return LayoutBuilder(
                              builder: (context, constraints) => SingleChildScrollView(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  bottom: wide ? 32.0 : 100.0,
                                ),
                                child: Center(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          ResponsiveHelper.maxContentWidth(
                                            wide
                                                ? constraints.maxWidth
                                                : MediaQuery.sizeOf(
                                                    context,
                                                  ).width,
                                          ),
                                    ),
                                    child: HorizontalPadding(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        spacing: 16.0,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 12.0,
                                            ),
                                            child: _staggered(
                                              0,
                                              HeroSection(
                                                userData: userData,
                                              ),
                                            ),
                                          ),
                                          if (aboutMe != null &&
                                              aboutMe.isNotEmpty)
                                            _staggered(
                                              1,
                                              AboutSection(
                                                aboutMe: aboutMe,
                                              ),
                                            ),
                                          if (lookingFor.isNotEmpty)
                                            _staggered(
                                              2,
                                              LookingForSection(
                                                specializations: lookingFor,
                                              ),
                                            ),
                                          if (skills.isNotEmpty)
                                            _staggered(
                                              3,
                                              SkillsSection(
                                                skills: skills,
                                              ),
                                            ),
                                          if (wide && chatId != null)
                                            _staggered(
                                              4,
                                              Center(
                                                child: OutlinedButton.icon(
                                                  onPressed: () =>
                                                      _onReport(chatId),
                                                  style: OutlinedButton.styleFrom(
                                                    foregroundColor:
                                                        AppColors.white.value,
                                                    side: BorderSide(
                                                      color: AppColors
                                                          .white
                                                          .value
                                                          .withValues(
                                                            alpha: 0.5,
                                                          ),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 20.0,
                                                          vertical: 12.0,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            14.0,
                                                          ),
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                    Icons.flag_outlined,
                                                    size: 18.0,
                                                  ),
                                                  label: Text(
                                                    lo.user_profile_report,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
