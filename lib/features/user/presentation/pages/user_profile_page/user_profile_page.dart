import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/utils/responsive_helper.dart';
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

class _UserProfilePageState extends State<UserProfilePage> {
  late final UserProfileBloc _userProfileBloc;

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
    _userProfileBloc.close();
    super.dispose();
  }

  void _onBack() {
    context.pop();
  }

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

    return BlocProvider.value(
      value: _userProfileBloc,
      child: BuildAnimatedBackground(
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            final userData = state.userData;
            final chatId = widget.chatId;

            return Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButton: userData == null || chatId == null
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
                      child: CustomBackBtn(
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

                          return SingleChildScrollView(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 100.0,
                            ),
                            child: Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: ResponsiveHelper.maxContentWidth(
                                    MediaQuery.sizeOf(context).width,
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
                                        child: HeroSection(
                                          userData: userData,
                                        ),
                                      ),
                                      if (aboutMe != null && aboutMe.isNotEmpty)
                                        AboutSection(
                                          aboutMe: aboutMe,
                                        ),
                                      if (lookingFor.isNotEmpty)
                                        LookingForSection(
                                          specializations: lookingFor,
                                        ),
                                      if (skills.isNotEmpty)
                                        SkillsSection(
                                          skills: skills,
                                        ),
                                    ],
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
    );
  }
}
