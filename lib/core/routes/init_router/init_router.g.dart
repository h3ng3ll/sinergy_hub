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
