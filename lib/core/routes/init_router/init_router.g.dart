// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$rootPageRoute];

RouteBase get $rootPageRoute => ShellRouteData.$route(
  navigatorKey: RootPageRoute.$navigatorKey,
  factory: $RootPageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(path: '/', factory: _$AuthorizationPageRoute._fromState),
    GoRouteData.$route(
      path: '/onboard',

      factory: _$OnboardSurveyPageRoute._fromState,
    ),
    StatefulShellRouteData.$route(
      factory: $HomeBottomBarRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',

              factory: _$HomePageRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/matches',

              factory: _$MatchesPageRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',

              factory: _$ProfilePageRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $RootPageRouteExtension on RootPageRoute {
  static RootPageRoute _fromState(GoRouterState state) => RootPageRoute();
}

mixin _$AuthorizationPageRoute on GoRouteData {
  static AuthorizationPageRoute _fromState(GoRouterState state) =>
      AuthorizationPageRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$OnboardSurveyPageRoute on GoRouteData {
  static OnboardSurveyPageRoute _fromState(GoRouterState state) =>
      OnboardSurveyPageRoute();

  @override
  String get location => GoRouteData.$location('/onboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

extension $HomeBottomBarRouteExtension on HomeBottomBarRoute {
  static HomeBottomBarRoute _fromState(GoRouterState state) =>
      HomeBottomBarRoute();
}

mixin _$HomePageRoute on GoRouteData {
  static HomePageRoute _fromState(GoRouterState state) => HomePageRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$MatchesPageRoute on GoRouteData {
  static MatchesPageRoute _fromState(GoRouterState state) => MatchesPageRoute();

  @override
  String get location => GoRouteData.$location('/matches');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ProfilePageRoute on GoRouteData {
  static ProfilePageRoute _fromState(GoRouterState state) => ProfilePageRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
