import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/widgets/btn/app_fab.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../bloc/user_profile_bloc/user_profile_bloc.dart';
import '../../../domain/usecases/get_user_data_use_case.dart';
import 'widgets/about_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/looking_for_section.dart';

class UserProfilePage extends StatefulWidget {
  final String userId;
  final String chatId;

  const UserProfilePage({
    super.key,
    required this.userId,
    required this.chatId,
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
        )
          ..add(
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

  void _onReport() {
    /// Always push (even on web) so the report page keeps a stack entry and
    /// can be popped — `.navigate`/`.go` would replace the route and trap the
    /// user on the report page with no way back.
    ReportUserPageRoute(
      chatId: widget.chatId,
      userId: widget.userId,
    ).push(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BlocProvider.value(
      value: _userProfileBloc,
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state.isLoading || state.isNoData) {
            return Scaffold(
              backgroundColor: AppColors.black.value,
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.white.value,
                ),
              ),
            );
          }

          if (state.isFailed) {
            return Scaffold(
              backgroundColor: AppColors.black.value,
              body: Center(
                child: Text(
                  state.errorMessage,
                  style: textTheme.medium16.copyWith(
                    color: AppColors.white.value,
                  ),
                ),
              ),
            );
          }

          final userData = state.userData!;

          return LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final pagePadding = ResponsiveHelper.responsivePadding(
                screenWidth,
                24.0,
              );
              final maxContentWidth = ResponsiveHelper.maxContentWidth(
                screenWidth,
              );

              return Scaffold(
                backgroundColor: AppColors.white.value,
                floatingActionButton: AppFab(
                  onPressed: _onReport,
                  child: const Icon(Icons.flag_outlined),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: maxContentWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeroSection(
                            userData: userData,
                            screenWidth: screenWidth,
                            textTheme: textTheme,
                            onBack: _onBack,
                          ),
                          HorizontalPadding(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: ResponsiveHelper.responsiveSpacing(
                                screenWidth,
                                32.0,
                              ),
                              children: [
                                if (userData
                                    .profiler
                                    .searchingSpecializations
                                    .isNotEmpty)
                                  LookingForSection(
                                    userData: userData,
                                    screenWidth: screenWidth,
                                    pagePadding: pagePadding,
                                    colorScheme: colorScheme,
                                    textTheme: textTheme,
                                  ),
                                if (userData.aboutMe != null &&
                                    userData.aboutMe!.isNotEmpty)
                                  AboutSection(
                                    userData: userData,
                                    screenWidth: screenWidth,
                                    colorScheme: colorScheme,
                                    textTheme: textTheme,
                                  ),
                                Gap(30.0),
                              ],
                            ),
                          ),
                        ],
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
}
