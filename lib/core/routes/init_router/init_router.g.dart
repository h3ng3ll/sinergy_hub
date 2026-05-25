// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$rootPageRoute];

RouteBase get $rootPageRoute => ShellRouteData.$route(
  factory: $RootPageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/',
      factory: $AuthorizationPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: '/sign-up',
          factory: $RegisterPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/sign-in',
          factory: $LoginPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/reset-password',
          factory: $ResetPasswordPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/privacy-policy',
          factory: $PrivacyPolicyPageRoute._fromState,
        ),
      ],
    ),
    ShellRouteData.$route(
      factory: $OnboardShellPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/onboard',
          factory: $OnboardSurveyPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/onboard-about',
          factory: $OnboardAboutYouPageRoute._fromState,
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
                      factory: $DiscoveryPageRoute._fromState,
                    ),
                  ],
                ),
                StatefulShellBranchData.$branch(
                  routes: [
                    GoRouteData.$route(
                      path: '/matches',
                      factory: $MatchesPageRoute._fromState,
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
              path: '/match-result',
              factory: $MatchResultPageRoute._fromState,
            ),
            ShellRouteData.$route(
              factory: $ChatShellRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/matches/:chatId',
                  factory: $ChatPageRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':userId',
                      factory: $UserProfilePageRoute._fromState,
                    ),
                    GoRouteData.$route(
                      path: '/',
                      factory: $ChatPageViewRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            GoRouteData.$route(
              path: '/edit-profile-page',
              factory: $EditProfilePageRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'looking-for-edit',
                  factory: $EditLookingForRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfilePageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/notification',
              factory: $NotificationPageRoute._fromState,
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

mixin $AuthorizationPageRoute on GoRouteData {
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

mixin $RegisterPageRoute on GoRouteData {
  static RegisterPageRoute _fromState(GoRouterState state) =>
      RegisterPageRoute();

  @override
  String get location => GoRouteData.$location('/sign-up');

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

mixin $LoginPageRoute on GoRouteData {
  static LoginPageRoute _fromState(GoRouterState state) => LoginPageRoute();

  @override
  String get location => GoRouteData.$location('/sign-in');

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

mixin $ResetPasswordPageRoute on GoRouteData {
  static ResetPasswordPageRoute _fromState(GoRouterState state) =>
      ResetPasswordPageRoute();

  @override
  String get location => GoRouteData.$location('/reset-password');

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

mixin $PrivacyPolicyPageRoute on GoRouteData {
  static PrivacyPolicyPageRoute _fromState(GoRouterState state) =>
      PrivacyPolicyPageRoute();

  @override
  String get location => GoRouteData.$location('/privacy-policy');

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

mixin $OnboardSurveyPageRoute on GoRouteData {
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

mixin $OnboardAboutYouPageRoute on GoRouteData {
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

mixin $DiscoveryPageRoute on GoRouteData {
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

mixin $MatchesPageRoute on GoRouteData {
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

mixin $MatchResultPageRoute on GoRouteData {
  static MatchResultPageRoute _fromState(GoRouterState state) =>
      MatchResultPageRoute(matchId: state.uri.queryParameters['match-id']!);

  MatchResultPageRoute get _self => this as MatchResultPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/match-result',
    queryParams: {'match-id': _self.matchId},
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

extension $ChatShellRouteExtension on ChatShellRoute {
  static ChatShellRoute _fromState(GoRouterState state) => ChatShellRoute();
}

mixin $ChatPageRoute on GoRouteData {
  static ChatPageRoute _fromState(GoRouterState state) =>
      ChatPageRoute(chatId: state.pathParameters['chatId']!);

  ChatPageRoute get _self => this as ChatPageRoute;

  @override
  String get location =>
      GoRouteData.$location('/matches/${Uri.encodeComponent(_self.chatId)}');

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

mixin $UserProfilePageRoute on GoRouteData {
  static UserProfilePageRoute _fromState(GoRouterState state) =>
      UserProfilePageRoute(
        userId: state.pathParameters['userId']!,
        chatId: state.pathParameters['chatId']!,
      );

  UserProfilePageRoute get _self => this as UserProfilePageRoute;

  @override
  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.chatId)}/${Uri.encodeComponent(_self.userId)}',
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

mixin $ChatPageViewRoute on GoRouteData {
  static ChatPageViewRoute _fromState(GoRouterState state) =>
      ChatPageViewRoute(chatId: state.uri.queryParameters['chat-id']!);

  ChatPageViewRoute get _self => this as ChatPageViewRoute;

  @override
  String get location =>
      GoRouteData.$location('/', queryParams: {'chat-id': _self.chatId});

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

mixin $EditProfilePageRoute on GoRouteData {
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

mixin $EditLookingForRoute on GoRouteData {
  static EditLookingForRoute _fromState(GoRouterState state) =>
      EditLookingForRoute();

  @override
  String get location =>
      GoRouteData.$location('/edit-profile-page/looking-for-edit');

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

mixin $ProfilePageRoute on GoRouteData {
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

mixin $NotificationPageRoute on GoRouteData {
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
