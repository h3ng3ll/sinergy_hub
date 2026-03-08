import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/authorization_page/authorization_page.dart';
import '../../../features/auth/presentation/pages/register_page/register_page.dart';
import '../../../features/calls/presentation/pages/call_page/call_page.dart';
import '../../../features/chat/presentation/pages/chat_page/chat_page.dart';
import '../../../features/home/presentation/home_bottom_bar/home_bottom_bar.dart';
import '../../../features/home/presentation/home_root/home_root.dart';
import '../../../features/matches/presentation/pages/discovery_page/discovery_page.dart';
import '../../../features/matches/presentation/pages/match_result_page/match_result_page.dart';
import '../../../features/matches/presentation/pages/matches_page/matches_page.dart';
import '../../../features/home/presentation/edit_profile_page/edit_profile_page.dart';
import '../../../features/home/presentation/tabs/profile_tab/profile_tab.dart';
import '../../../features/notifications/presentation/pages/notification_page/notification_page.dart';
import '../../../features/onboard_survey/presentation/pages/onboard_about_you_page/onboard_about_you_page.dart';
import '../../../features/onboard_survey/presentation/pages/onboard_shell_page/onboard_shell_page.dart';
import '../../../features/onboard_survey/presentation/pages/onboard_survey_page/onboard_survey_page.dart';
import '../../../features/user/presentation/pages/edit_looking_for_page/edit_looking_for_page.dart';
import '../root_page/root_page.dart';

part 'init_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter initRouter = GoRouter(
  routes: $appRoutes,
);

@TypedShellRoute<RootPageRoute>(
  routes: [
    TypedGoRoute<AuthorizationPageRoute>(
      path: '/',
      routes: [
        TypedGoRoute<RegisterPageRoute>(
          path: '/sign-out',
        ),
      ],
    ),
    TypedShellRoute<OnboardShellPageRoute>(
      routes: [
        TypedGoRoute<OnboardSurveyPageRoute>(
          path: '/onboard',
        ),
        TypedGoRoute<OnboardAboutYouPageRoute>(
          path: '/onboard-about',
        ),
      ],
    ),
    TypedStatefulShellRoute<HomeRootRoute>(
      branches: [
        TypedStatefulShellBranch(
          routes: [
            TypedStatefulShellRoute<HomeBottomBarRoute>(
              branches: [
                TypedStatefulShellBranch(
                  routes: [
                    TypedGoRoute<DiscoveryPageRoute>(
                      path: '/discovery',
                    ),
                  ],
                ),
                TypedStatefulShellBranch(
                  routes: [
                    TypedGoRoute<MatchesPageRoute>(
                      path: '/matches',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        TypedStatefulShellBranch(
          routes: [
            TypedGoRoute<MatchResultPageRoute>(
              path: '/match-result',
            ),
            TypedGoRoute<ChatPageRoute>(
              path: '/chat',
            ),
            TypedGoRoute<EditProfilePageRoute>(
              path: '/edit-profile-page',
              routes: [
                TypedGoRoute<EditLookingForRoute>(
                  path: 'looking-for-edit',
                ),
              ],
            ),
            TypedGoRoute<ProfilePageRoute>(
              path: '/profile',
            ),
            TypedGoRoute<NotificationPageRoute>(
              path: '/notification',
            ),
            TypedGoRoute<CallPageRoute>(
              path: '/call',
            ),
          ],
        ),
      ],
    ),
  ],
)
class RootPageRoute extends ShellRouteData {
  // static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  static final GlobalKey rootKey = GlobalKey();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return RootPage(
      key: rootKey,
      navigator: navigator,
    );
  }
}

class AuthorizationPageRoute extends GoRouteData with _$AuthorizationPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      AuthorizationPage(),
    );
  }

  // @override
  // FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
  //   final ref = ProviderScope.containerOf(
  //     context,
  //   );
  //   final isAuthorized = ref.read(
  //     isAuthorizedProvider,
  //   );
  //   return isAuthorized ? HomePageRoute().location : null;
  // }
}

class RegisterPageRoute extends GoRouteData with _$RegisterPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      RegisterPage(),
    );
  }
}

class OnboardShellPageRoute extends ShellRouteData {
  // @override
  // Page<void> buildPage(BuildContext context, GoRouterState state) {
  //   return GoRouterPageBuilder.pageBuilder(
  //     OnboardSurveyPage(),
  //   );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return OnboardShellPage(
      child: navigator,
    );
  }
}

class OnboardSurveyPageRoute extends GoRouteData with _$OnboardSurveyPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      OnboardSurveyPage(),
    );
  }
}

class OnboardAboutYouPageRoute extends GoRouteData
    with _$OnboardAboutYouPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      OnboardAboutYouPage(),
    );
  }
}

class HomeBottomBarRoute extends StatefulShellRouteData {
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return HomeBottomBar(
      navigationShell: navigationShell,
    );
  }
}

class DiscoveryPageRoute extends GoRouteData with _$DiscoveryPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      DiscoveryPage(),
    );
  }
}

class MatchesPageRoute extends GoRouteData with _$MatchesPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      MatchesPage(),
    );
  }
}

class ProfilePageRoute extends GoRouteData with _$ProfilePageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      ProfileTab(),
    );
  }
}

class EditLookingForRoute extends GoRouteData with _$EditLookingForRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      EditLookingForPage(),
    );
  }
}

class MatchResultPageRoute extends GoRouteData with _$MatchResultPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      MatchResultPage(
        currentUserName: '',
        currentUserAvatar: '',
        currentUserRole: '',
        matchedUserName: '',
        matchedUserAvatar: '',
        matchedUserRole: '',
        compatibilityScore: 3,
        skillsMatch: 5,
        visionAlign: 3,
        experienceScore: 7,
      ),
    );
  }
}

class HomeRootRoute extends StatefulShellRouteData {
  // static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigationShell,
  ) {
    return HomeRoot(
      navigator: navigationShell,
    );
  }
}

class ChatPageRoute extends GoRouteData with _$ChatPageRoute {
  final String chatId;

  ChatPageRoute({
    required this.chatId,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      ChatPage(
        chatId: chatId,
      ),
    );
  }
}

class NotificationPageRoute extends GoRouteData with _$NotificationPageRoute {
  NotificationPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      NotificationPage(),
    );
  }
}

class EditProfilePageRoute extends GoRouteData with _$EditProfilePageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      EditProfilePage(),
    );
  }
}

class CallPageRoute extends GoRouteData with _$CallPageRoute {
  final String? calleeId;
  final String? callId;

  CallPageRoute({
    this.calleeId,
    this.callId,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      CallPage(
        calleeId: calleeId,
        callId: callId,
      ),
    );
  }
}

class GoRouterPageBuilder {
  static CustomTransitionPage pageBuilder(Widget child) {
    return CustomTransitionPage<void>(
      child: child,
      transitionsBuilder:
          (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            return FadeTransition(
              opacity:
                  CurveTween(
                    curve: Curves.easeIn,
                  ).animate(
                    animation,
                  ),
              child: child,
            );
          },
    );
  }
}
