// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$rootPageRoute, $noConnectionPageRoute];

RouteBase get $rootPageRoute => ShellRouteData.$route(
  factory: $RootPageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/',
      hasOverriddenOnExit: false,
      factory: $AuthorizationPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: '/sign-up',
          hasOverriddenOnExit: false,
          factory: $RegisterPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/sign-in',
          hasOverriddenOnExit: false,
          factory: $LoginPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/reset-password',
          hasOverriddenOnExit: false,
          factory: $ResetPasswordPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/privacy-policy',
          hasOverriddenOnExit: false,
          factory: $PrivacyPolicyPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/support',
          hasOverriddenOnExit: false,
          factory: $SupportPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/terms-of-use',
          hasOverriddenOnExit: false,
          factory: $TermsOfUsePageRoute._fromState,
        ),
      ],
    ),
    ShellRouteData.$route(
      factory: $OnboardShellPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/onboard',
          hasOverriddenOnExit: false,
          factory: $OnboardSurveyPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: '/onboard-about',
          hasOverriddenOnExit: false,
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
                      hasOverriddenOnExit: false,
                      factory: $DiscoveryPageRoute._fromState,
                    ),
                  ],
                ),
                StatefulShellBranchData.$branch(
                  routes: [
                    GoRouteData.$route(
                      path: '/liked-you',
                      hasOverriddenOnExit: false,
                      factory: $LikedYouPageRoute._fromState,
                    ),
                  ],
                ),
                StatefulShellBranchData.$branch(
                  routes: [
                    GoRouteData.$route(
                      path: '/matches',
                      hasOverriddenOnExit: false,
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
              hasOverriddenOnExit: false,
              factory: $MatchResultPageRoute._fromState,
            ),
            ShellRouteData.$route(
              factory: $ChatShellRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/matches/:chatId',
                  hasOverriddenOnExit: false,
                  factory: $ChatPageRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':userId',
                      hasOverriddenOnExit: false,
                      factory: $UserProfilePageRoute._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: 'report',
                          hasOverriddenOnExit: false,
                          factory: $ReportUserPageRoute._fromState,
                        ),
                      ],
                    ),
                    GoRouteData.$route(
                      path: '/',
                      hasOverriddenOnExit: false,
                      factory: $ChatPageViewRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
            GoRouteData.$route(
              path: '/edit-profile-page',
              hasOverriddenOnExit: false,
              factory: $EditProfilePageRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'looking-for-edit',
                  hasOverriddenOnExit: false,
                  factory: $EditLookingForRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: '/profile',
              hasOverriddenOnExit: false,
              factory: $ProfilePageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/notification',
              hasOverriddenOnExit: false,
              factory: $NotificationPageRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/settings',
              hasOverriddenOnExit: false,
              factory: $SettingsPageRoute._fromState,
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

mixin $SupportPageRoute on GoRouteData {
  static SupportPageRoute _fromState(GoRouterState state) => SupportPageRoute();

  @override
  String get location => GoRouteData.$location('/support');

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

mixin $TermsOfUsePageRoute on GoRouteData {
  static TermsOfUsePageRoute _fromState(GoRouterState state) =>
      TermsOfUsePageRoute();

  @override
  String get location => GoRouteData.$location('/terms-of-use');

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

mixin $LikedYouPageRoute on GoRouteData {
  static LikedYouPageRoute _fromState(GoRouterState state) =>
      LikedYouPageRoute();

  @override
  String get location => GoRouteData.$location('/liked-you');

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

mixin $ReportUserPageRoute on GoRouteData {
  static ReportUserPageRoute _fromState(GoRouterState state) =>
      ReportUserPageRoute(
        chatId: state.pathParameters['chatId']!,
        userId: state.pathParameters['userId']!,
      );

  ReportUserPageRoute get _self => this as ReportUserPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.chatId)}/${Uri.encodeComponent(_self.userId)}/report',
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

mixin $SettingsPageRoute on GoRouteData {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      SettingsPageRoute();

  @override
  String get location => GoRouteData.$location('/settings');

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

RouteBase get $noConnectionPageRoute => GoRouteData.$route(
  path: '/no-connection',
  hasOverriddenOnExit: false,
  factory: $NoConnectionPageRoute._fromState,
);

mixin $NoConnectionPageRoute on GoRouteData {
  static NoConnectionPageRoute _fromState(GoRouterState state) =>
      NoConnectionPageRoute();

  @override
  String get location => GoRouteData.$location('/no-connection');

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
