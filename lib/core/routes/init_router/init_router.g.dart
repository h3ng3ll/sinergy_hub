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
    GoRouteData.$route(
      path: '/',
      factory: _$AuthorizationPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: '/sign-out',
          factory: _$RegisterPageRoute._fromState,
        ),
      ],
    ),
    ShellRouteData.$route(
      factory: $OnboardShellPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/onboard',
          factory: _$OnboardSurveyPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/onboard-about',
          factory: _$OnboardAboutYouPageRoute._fromState,
        ),
      ],
    ),
    StatefulShellRouteData.$route(
      factory: $HomeRootRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            StatefulShellRouteData.$route(
              factory: $HomeBottomBarRouteExtension._fromState,
              branches: [
                StatefulShellBranchData.$branch(
                  routes: [
                    GoRouteData.$route(
                      path: '/discovery',
                      factory: _$DiscoveryPageRoute._fromState,
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
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/chat',
              factory: _$ChatPageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/edit-profile-page',
              factory: _$EditProfilePageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/profile',
              factory: _$ProfilePageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/notification',
              factory: _$NotificationPageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/call',
              factory: _$CallPageRoute._fromState,
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

mixin _$RegisterPageRoute on GoRouteData {
  static RegisterPageRoute _fromState(GoRouterState state) =>
      RegisterPageRoute();

  @override
  String get location => GoRouteData.$location('/sign-out');

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

extension $OnboardShellPageRouteExtension on OnboardShellPageRoute {
  static OnboardShellPageRoute _fromState(GoRouterState state) =>
      OnboardShellPageRoute();
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

mixin _$OnboardAboutYouPageRoute on GoRouteData {
  static OnboardAboutYouPageRoute _fromState(GoRouterState state) =>
      OnboardAboutYouPageRoute();

  @override
  String get location => GoRouteData.$location('/onboard-about');

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

extension $HomeRootRouteExtension on HomeRootRoute {
  static HomeRootRoute _fromState(GoRouterState state) => HomeRootRoute();
}

extension $HomeBottomBarRouteExtension on HomeBottomBarRoute {
  static HomeBottomBarRoute _fromState(GoRouterState state) =>
      HomeBottomBarRoute();
}

mixin _$DiscoveryPageRoute on GoRouteData {
  static DiscoveryPageRoute _fromState(GoRouterState state) =>
      DiscoveryPageRoute();

  @override
  String get location => GoRouteData.$location('/discovery');

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

mixin _$ChatPageRoute on GoRouteData {
  static ChatPageRoute _fromState(GoRouterState state) =>
      ChatPageRoute(chatId: state.uri.queryParameters['chat-id']!);

  ChatPageRoute get _self => this as ChatPageRoute;

  @override
  String get location =>
      GoRouteData.$location('/chat', queryParams: {'chat-id': _self.chatId});

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

mixin _$EditProfilePageRoute on GoRouteData {
  static EditProfilePageRoute _fromState(GoRouterState state) =>
      EditProfilePageRoute();

  @override
  String get location => GoRouteData.$location('/edit-profile-page');

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

mixin _$NotificationPageRoute on GoRouteData {
  static NotificationPageRoute _fromState(GoRouterState state) =>
      NotificationPageRoute();

  @override
  String get location => GoRouteData.$location('/notification');

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

mixin _$CallPageRoute on GoRouteData {
  static CallPageRoute _fromState(GoRouterState state) => CallPageRoute(
    calleeId: state.uri.queryParameters['callee-id'],
    callId: state.uri.queryParameters['call-id'],
  );

  CallPageRoute get _self => this as CallPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/call',
    queryParams: {
      if (_self.calleeId != null) 'callee-id': _self.calleeId,
      if (_self.callId != null) 'call-id': _self.callId,
    },
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
