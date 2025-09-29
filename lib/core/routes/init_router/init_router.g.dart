// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $rootPageRoute,
    ];

RouteBase get $rootPageRoute => ShellRouteData.$route(
      navigatorKey: RootPageRoute.$navigatorKey,
      factory: $RootPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: _$RegisterPageRoute._fromState,
        ),
      ],
    );

extension $RootPageRouteExtension on RootPageRoute {
  static RootPageRoute _fromState(GoRouterState state) => RootPageRoute();
}

mixin _$RegisterPageRoute on GoRouteData {
  static RegisterPageRoute _fromState(GoRouterState state) =>
      RegisterPageRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

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
