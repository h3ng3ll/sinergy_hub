import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/authorization_page/authorization_page.dart';
import '../../../features/onboard_survey/presentation/pages/onboard_survey_page/onboard_survey_page.dart';
import '../root_page/root_page.dart';

part 'init_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter initRouter = GoRouter(
  routes: $appRoutes,
);

@TypedShellRoute<RootPageRoute>(
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<AuthorizationPageRoute>(
      path: '/',
    ),
    TypedGoRoute<OnboardSurveyPageRoute>(
      path: '/onboard',
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
