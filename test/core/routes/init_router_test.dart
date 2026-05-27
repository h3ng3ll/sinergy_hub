import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/core/routes/init_router/init_router.dart';
import 'package:sinergy_hub/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:sinergy_hub/features/connectivity/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/onboard_status/onboard_status.dart';
import 'package:sinergy_hub/features/onboard_survey/presentation/bloc/onboard_bloc/onboard_bloc.dart';

class _FakeUser extends Fake implements User {
  @override
  String get uid => 'uid-1';
}

AuthState _auth({
  required AuthStatus status,
  bool emailVerified = true,
  User? user,
}) =>
    AuthState(
      status: status,
      user: user,
      isEmailVerified: emailVerified,
    );

OnboardState _onboard({
  bool toldAboutYourself = false,
  bool completeSpecialization = false,
  EOnboardStatus status = EOnboardStatus.loaded,
}) =>
    OnboardState(
      onboardStatus: OnboardStatus(
        toldAboutYourself: toldAboutYourself,
        completeSpecialization: completeSpecialization,
      ),
      status: status,
    );

String? _go({
  required AuthState auth,
  required OnboardState onboard,
  required String location,
  ConnectivityState connectivity = const ConnectivityState(),
}) =>
    resolveRedirect(
      auth: auth,
      onboard: onboard,
      connectivity: connectivity,
      location: location,
    );

void main() {
  // Pre-compute the route literals once so they can be reused in expectations.
  final discovery = DiscoveryPageRoute().location;
  final authorization = AuthorizationPageRoute().location;
  final signIn = LoginPageRoute().location;
  final onboardAbout = OnboardAboutYouPageRoute().location;
  final onboardSurvey = OnboardSurveyPageRoute().location;
  final noConnection = NoConnectionPageRoute().location;

  group('resolveRedirect — logged-out user', () {
    test('1. logout user on /discovery is redirected to authorization', () {
      expect(
        _go(
          auth: _auth(status: AuthStatus.logout),
          onboard: _onboard(),
          location: discovery,
        ),
        authorization,
      );
    });

    test('2. logout user is allowed to stay on /sign-in', () {
      expect(
        _go(
          auth: _auth(status: AuthStatus.logout),
          onboard: _onboard(),
          location: signIn,
        ),
        isNull,
      );
    });

    test('logout user is allowed to stay on authorization', () {
      expect(
        _go(
          auth: _auth(status: AuthStatus.logout),
          onboard: _onboard(),
          location: authorization,
        ),
        isNull,
      );
    });
  });

  group('resolveRedirect — authorized but onboard not yet loaded', () {
    test(
      '3. authorized + onboard.initial → no redirect (splash holds the UI)',
      () {
        expect(
          _go(
            auth: _auth(
              status: AuthStatus.authorized,
              user: _FakeUser(),
            ),
            onboard: _onboard(status: EOnboardStatus.initial),
            location: discovery,
          ),
          isNull,
        );
      },
    );

    test('authorized + onboard.loading → no redirect', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(status: EOnboardStatus.loading),
          location: discovery,
        ),
        isNull,
      );
    });
  });

  group('resolveRedirect — authorized + brand new user', () {
    test('4. brand-new on /discovery → /onboard-about', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(),
          location: discovery,
        ),
        onboardAbout,
      );
    });

    test('9. brand-new on /onboard-about → stay', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(),
          location: onboardAbout,
        ),
        isNull,
      );
    });

    test('brand-new on /onboard → forced back to /onboard-about', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(),
          location: onboardSurvey,
        ),
        onboardAbout,
      );
    });
  });

  group('resolveRedirect — authorized + toldAboutYourself', () {
    test('5. on /discovery → /onboard', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(toldAboutYourself: true),
          location: discovery,
        ),
        onboardSurvey,
      );
    });

    test('6. on /onboard-about → /onboard', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(toldAboutYourself: true),
          location: onboardAbout,
        ),
        onboardSurvey,
      );
    });

    test('on /onboard → stay', () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            user: _FakeUser(),
          ),
          onboard: _onboard(toldAboutYourself: true),
          location: onboardSurvey,
        ),
        isNull,
      );
    });
  });

  group('resolveRedirect — authorized + completeSpecialization', () {
    final fullyOnboarded = _onboard(
      toldAboutYourself: true,
      completeSpecialization: true,
    );
    final authed = _auth(
      status: AuthStatus.authorized,
      user: _FakeUser(),
    );

    test('7. on / (auth landing) → /discovery', () {
      expect(
        _go(auth: authed, onboard: fullyOnboarded, location: authorization),
        discovery,
      );
    });

    test('8. on /onboard → /discovery (already done)', () {
      expect(
        _go(auth: authed, onboard: fullyOnboarded, location: onboardSurvey),
        discovery,
      );
    });

    test('on /onboard-about → /discovery (already done)', () {
      expect(
        _go(auth: authed, onboard: fullyOnboarded, location: onboardAbout),
        discovery,
      );
    });

    test('on /discovery → stay', () {
      expect(
        _go(auth: authed, onboard: fullyOnboarded, location: discovery),
        isNull,
      );
    });

    test('on /matches → stay', () {
      expect(
        _go(auth: authed, onboard: fullyOnboarded, location: '/matches'),
        isNull,
      );
    });
  });

  group('resolveRedirect — auth in transient/initial state', () {
    test('AuthStatus.initial → no redirect (waiting on auth resolution)', () {
      expect(
        _go(
          auth: _auth(status: AuthStatus.initial, emailVerified: false),
          onboard: _onboard(),
          location: discovery,
        ),
        isNull,
      );
    });

    test('authorized but email NOT verified → treated as not-auth, no redirect',
        () {
      expect(
        _go(
          auth: _auth(
            status: AuthStatus.authorized,
            emailVerified: false,
            user: _FakeUser(),
          ),
          onboard: _onboard(),
          location: discovery,
        ),
        isNull,
      );
    });
  });

  group('resolveRedirect — connectivity gate', () {
    final fullyOnboarded = _onboard(
      toldAboutYourself: true,
      completeSpecialization: true,
    );
    final authed = _auth(
      status: AuthStatus.authorized,
      user: _FakeUser(),
    );
    const offline = ConnectivityState(status: ConnectivityStatus.offline);
    const online = ConnectivityState(status: ConnectivityStatus.online);

    test('authorized + offline + not on /no-connection → /no-connection', () {
      expect(
        _go(
          auth: authed,
          onboard: fullyOnboarded,
          location: discovery,
          connectivity: offline,
        ),
        noConnection,
      );
    });

    test(
      'authorized + online + on /no-connection + fully onboarded → /discovery',
      () {
        expect(
          _go(
            auth: authed,
            onboard: fullyOnboarded,
            location: noConnection,
            connectivity: online,
          ),
          discovery,
        );
      },
    );

    test(
      'authorized + online + on /no-connection + toldAboutYourself → /onboard',
      () {
        expect(
          _go(
            auth: authed,
            onboard: _onboard(toldAboutYourself: true),
            location: noConnection,
            connectivity: online,
          ),
          onboardSurvey,
        );
      },
    );

    test(
      'authorized + online + on /no-connection + brand new → /onboard-about',
      () {
        expect(
          _go(
            auth: authed,
            onboard: _onboard(),
            location: noConnection,
            connectivity: online,
          ),
          onboardAbout,
        );
      },
    );

    test(
      'authorized + online + on /no-connection + onboard not yet loaded → null (wait)',
      () {
        expect(
          _go(
            auth: authed,
            onboard: _onboard(status: EOnboardStatus.loading),
            location: noConnection,
            connectivity: online,
          ),
          isNull,
        );
      },
    );

    test('logout user + offline on auth route → null (unauthorized untouched)',
        () {
      expect(
        _go(
          auth: _auth(status: AuthStatus.logout),
          onboard: _onboard(),
          location: signIn,
          connectivity: offline,
        ),
        isNull,
      );
    });

    test('authorized + connectivity.initial → not gated (no /no-connection)',
        () {
      expect(
        _go(
          auth: authed,
          onboard: fullyOnboarded,
          location: discovery,
          // default: ConnectivityState(initial)
        ),
        isNull,
      );
    });
  });
}
