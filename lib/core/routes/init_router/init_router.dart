import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/presentation/pages/register_page/register_page.dart';
import '../root_page/root_page.dart';

part 'init_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter initRouter = GoRouter(
  routes: $appRoutes,
);

@TypedShellRoute<RootPageRoute>(
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<RegisterPageRoute>(
      path: '/',
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

class RegisterPageRoute extends GoRouteData with _$RegisterPageRoute {

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return GoRouterPageBuilder.pageBuilder(
      RegisterPage(
      ),
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

class GoRouterPageBuilder {
  static CustomTransitionPage pageBuilder(Widget child) {
    return CustomTransitionPage<void>(
      child: child,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return FadeTransition(
          opacity: CurveTween(
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
