import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/authorization_page/authorization_page.dart';
import '../../../features/chat/presentation/pages/chat_page/chat_page.dart';
import '../../../features/home/presentation/home_bottom_bar/home_bottom_bar.dart';
import '../../../features/home/presentation/home_root/home_root.dart';
import '../../../features/home/presentation/tabs/home_tab/home_tab.dart';
import '../../../features/matches/presentation/pages/matches_page/matches_page.dart';
import '../../../features/home/presentation/tabs/profile_tab/pages/edit_profile_page/edit_profile_page.dart';
import '../../../features/home/presentation/tabs/profile_tab/profile_tab.dart';
import '../../../features/onboard_survey/presentation/pages/onboard_survey_page/onboard_survey_page.dart';
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
    ),
    TypedGoRoute<OnboardSurveyPageRoute>(
      path: '/onboard',
    ),
    TypedStatefulShellRoute<HomeRootRoute>(
      branches: [
        TypedStatefulShellBranch(
          routes: [
            TypedStatefulShellRoute<HomeBottomBarRoute>(
              branches: [
                TypedStatefulShellBranch(
                  routes: [
                    TypedGoRoute<HomePageRoute>(
                      path: '/home',
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
            TypedGoRoute<ChatPageRoute>(
              path: '/chat',
            ),
            TypedGoRoute<EditProfilePageRoute>(
              path: '/edit-profile-page',
            ),
            TypedGoRoute<ProfilePageRoute>(
              path: '/profile',
            ),
          ],
        ),
      ],
    ),
  ],
)
class RootPageRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return RootPage(
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

class OnboardSurveyPageRoute extends GoRouteData with _$OnboardSurveyPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      OnboardSurveyPage(),
    );
  }
}

class HomeBottomBarRoute extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

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

class HomePageRoute extends GoRouteData with _$HomePageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      HomeTab(),
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

class HomeRootRoute extends StatefulShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

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

class EditProfilePageRoute extends GoRouteData with _$EditProfilePageRoute {

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      EditProfilePage(),
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
