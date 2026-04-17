import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';

import '../../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../features/auth/presentation/pages/authorization_page/authorization_page.dart';
import '../../../features/auth/presentation/pages/login_page/login_page.dart';
import '../../../features/auth/presentation/pages/register_page/register_page.dart';
import '../../../features/chat/presentation/pages/chat_page/chat_page.dart';
import '../../../features/chat/presentation/pages/chat_shell/chat_shell.dart';
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
import '../../../features/user/presentation/bloc/user_bloc/user_bloc.dart';
import '../../../features/user/presentation/pages/edit_looking_for_page/edit_looking_for_page.dart';
import '../../../features/user/presentation/pages/user_profile_page/user_profile_page.dart';
import '../../di/injection.dart';
import '../../utils/extensions/go_router_x.dart';
import '../root_page/root_page.dart';

part 'init_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter initRouter({
  required AuthBloc authBloc,
  required UserBloc userBloc,
}) => GoRouter(
  routes: $appRoutes,
  refreshListenable: GoRouterRefreshStream(
    Rx.merge([
      authBloc.stream.map((_) => null),
      userBloc.stream.map((_) => null),
    ]),
  ),
  redirect: (context, state) {
    final auth = authBloc.state;
    final user = userBloc.state;
    final location = state.matchedLocation;

    final isAuth = auth.isAuthorized;
    final isLogout = auth.isLogout;

    final isOnAuthPage = location == AuthorizationPageRoute().location;

    final isAuthRoute = context.isAuthRoute(
      location,
    );
    final isOnOnboard =
        location == OnboardAboutYouPageRoute().location ||
        location == OnboardSurveyPageRoute().location;

    // 🔴 1. not logged in → only allow auth routes
    if (isLogout && !isAuthRoute) {
      return AuthorizationPageRoute().location;
    }

    // 🔵 2. logged in but no profile → onboarding
    if (isAuth && user.isNoData && !isOnOnboard) {
      return OnboardAboutYouPageRoute().location;
    }

    // 🟢 3. logged in → app
    if (isAuth && isOnAuthPage) {
      return DiscoveryPageRoute().location;
    }

    return null;
  },
);

@TypedShellRoute<RootPageRoute>(
  routes: [
    TypedGoRoute<AuthorizationPageRoute>(
      path: '/',
      routes: [
        TypedGoRoute<RegisterPageRoute>(
          path: '/sign-up',
        ),
        TypedGoRoute<LoginPageRoute>(
          path: '/sign-in',
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
            TypedShellRoute<ChatShellRoute>(
              routes: [
                TypedGoRoute<ChatPageRoute>(
                  path: '/matches/:chatId',
                  routes: [
                    TypedGoRoute<UserProfilePageRoute>(
                      path: ':userId',
                    ),
                    TypedGoRoute<ChatPageViewRoute>(
                      path: '/',
                    ),
                  ],
                ),
              ],
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

class AuthorizationPageRoute extends GoRouteData with $AuthorizationPageRoute {
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

class RegisterPageRoute extends GoRouteData with $RegisterPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      RegisterPage(),
    );
  }
}

class LoginPageRoute extends GoRouteData with $LoginPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      LoginPage(),
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

class OnboardSurveyPageRoute extends GoRouteData with $OnboardSurveyPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      OnboardSurveyPage(),
    );
  }
}

class OnboardAboutYouPageRoute extends GoRouteData
    with $OnboardAboutYouPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      OnboardAboutYouPage(),
    );
  }
}

class HomeBottomBarRoute extends StatefulShellRouteData {
  static final homeBottomBarKey = GlobalKey();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return HomeBottomBar(
      key: homeBottomBarKey,
      navigationShell: navigationShell,
    );
  }
}

class DiscoveryPageRoute extends GoRouteData with $DiscoveryPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      DiscoveryPage(),
    );
  }
}

class MatchesPageRoute extends GoRouteData with $MatchesPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      MatchesPage(),
    );
  }
}

class ProfilePageRoute extends GoRouteData with $ProfilePageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      ProfileTab(),
    );
  }
}

class EditLookingForRoute extends GoRouteData with $EditLookingForRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      EditLookingForPage(),
    );
  }
}

class MatchResultPageRoute extends GoRouteData with $MatchResultPageRoute {
  final String matchId;

  const MatchResultPageRoute({
    required this.matchId,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      MatchResultPage(
        matchId: matchId,
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

class ChatPageRoute extends GoRouteData with $ChatPageRoute {
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

class ChatPageViewRoute extends GoRouteData with $ChatPageViewRoute {
  final String chatId;

  ChatPageViewRoute({
    required this.chatId,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      Container(),
    );
  }
}

class ChatShellRoute extends ShellRouteData {
  // static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return ChatShell(
      navigationShell: navigator,
    );
  }
}

class UserProfilePageRoute extends GoRouteData with $UserProfilePageRoute {
  final String userId;
  final String chatId;

  const UserProfilePageRoute({
    required this.userId,
    required this.chatId,
  });

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      UserProfilePage(
        userId: userId,
      ),
    );
  }
}

class NotificationPageRoute extends GoRouteData with $NotificationPageRoute {
  NotificationPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      NotificationPage(),
    );
  }
}

class EditProfilePageRoute extends GoRouteData with $EditProfilePageRoute {
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
