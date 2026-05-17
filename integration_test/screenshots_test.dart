           // ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sinergy_hub/core/di/injection.dart';
import 'package:sinergy_hub/core/resources/app_locale.dart';
import 'package:sinergy_hub/core/resources/app_theme.dart';
import 'package:sinergy_hub/core/resources/translations/app_localizations.dart';
import 'package:sinergy_hub/core/routes/init_router/init_router.dart';
import 'package:sinergy_hub/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:sinergy_hub/features/matches/domain/models/matches_filter/matches_filter.dart';
import 'package:sinergy_hub/features/matches/presentation/dialogs/filter_modal/matches_filters_modal_sheet.dart';
import 'package:sinergy_hub/features/notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/skills_bloc/skills_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/user_bloc/user_bloc.dart';

import 'mocks/test_di.dart';

final Set<String> _failedCaptures = <String>{};
late GoRouter _router;

Future<void> _settle(WidgetTester tester) async {
  for (int i = 0; i < 6; i++) {
    await tester.pump(const Duration(milliseconds: 250));
  }
  try {
    await tester.pump(const Duration(seconds: 2));
  } catch (e) {
    debugPrint('_settle pumpAndSettle ignored: $e');
  }
}

Future<void> _settleLive(
  WidgetTester tester, {
  int frames = 12,
  Duration each = const Duration(milliseconds: 200),
}) async {
  for (int i = 0; i < frames; i++) {
    await tester.pump(each);
  }
}

/// Whether `convertFlutterSurfaceToImage()` has been invoked yet.
/// On Android the call is required exactly once before the first
/// `takeScreenshot` — calling it a second time asserts inside
/// integration_test's `_callback_io.dart`. On iOS the call is a no-op.
/// On every other platform the call is unsupported. We track the state
/// here so the conversion stays in effect across all captures.
bool _surfaceConverted = false;

Future<void> _ensureSurfaceConverted(
  IntegrationTestWidgetsFlutterBinding binding,
  WidgetTester tester,
) async {
  if (_surfaceConverted) return;
  await binding.convertFlutterSurfaceToImage();
  _surfaceConverted = true;
  for (int i = 0; i < 3; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

Future<void> _capture(
  IntegrationTestWidgetsFlutterBinding binding,
  WidgetTester tester,
  String name, {
  bool live = false,
}) async {
  try {
    if (live) {
      await _settleLive(tester);
    } else {
      await _settle(tester);
    }
    await _ensureSurfaceConverted(binding, tester);
    await binding.takeScreenshot(name);
    debugPrint('captured: $name');
  } catch (e, st) {
    debugPrint('CAPTURE FAILED: $name -> $e\n$st');
    _failedCaptures.add(name);
  }
}

Future<void> _captureWithTimeout(
  IntegrationTestWidgetsFlutterBinding binding,
  WidgetTester tester,
  String name, {
  bool live = false,
  Duration timeout = const Duration(seconds: 15),
}) async {
  try {
    await _capture(binding, tester, name, live: live).timeout(timeout);
  } on TimeoutException catch (e) {
    debugPrint('CAPTURE TIMED OUT: $name -> $e');
    _failedCaptures.add(name);
  }
}

Future<void> _safeGo(
  WidgetTester tester,
  String path, {
  bool live = false,
}) async {
  try {
    _router.go(path);
  } catch (e) {
    debugPrint('safeGo: GoRouter.go($path) failed: $e');
  }
  if (live) {
    await _settleLive(tester);
  } else {
    await _settle(tester);
  }
}

/// Test-only widget tree that mirrors `MyApp.build()` but provides the
/// mocked global blocs from `getIt`. We never call `app.main()` because
/// it boots Firebase, dotenv, and Crashlytics — none of which are
/// available in the screenshot harness.
class _TestApp extends StatelessWidget {
  final GoRouter router;

  const _TestApp({required this.router});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>.value(value: testUserBloc),
        BlocProvider<AuthBloc>.value(value: testAuthBloc),
        BlocProvider<SkillsBloc>(create: (_) => getIt<SkillsBloc>()),
        BlocProvider<ChatBloc>.value(value: getIt<ChatBloc>()),
        BlocProvider<NotificationConfigBloc>.value(
          value: getIt<NotificationConfigBloc>(),
        ),
      ],
      child: ResponsiveBreakpoints(
        breakpoints: const [
          Breakpoint(start: 0, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 900, name: TABLET),
          Breakpoint(start: 900, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: MaterialApp.router(
          theme: AppThemeData.light,
          supportedLocales: AppLocale.supportedLocales,
          locale: AppLocale.startLocale,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}

void main() {

  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;


  setUpAll(() async {
    await setupTestDI();
    _router = initRouter(authBloc: testAuthBloc, userBloc: testUserBloc);
  });

  testWidgets('sinergy_hub screenshots', (tester) async {
    await tester.pumpWidget(_TestApp(router: _router));
    await _settle(tester);

    // ---- PUBLIC AUTH SCREENS (4) ----
    // Flip auth bloc to logout so router-redirect lets us hit auth pages.
    testAuthBloc.setLogout();
    debugPrint('GO -> authorization_page');
    await _safeGo(tester, '/');
    debugPrint('DONE -> authorization_page');
    await _captureWithTimeout(binding, tester, '01_authorization_page');

    debugPrint('GO -> sign-in');
    await _safeGo(tester, '/sign-in');
    debugPrint('DONE -> sign-in');
    await _captureWithTimeout(binding, tester, '02_login_page');

    debugPrint('GO -> sign-up');
    await _safeGo(tester, '/sign-up');
    debugPrint('DONE -> sign-up');
    await _captureWithTimeout(binding, tester, '03_register_page');

    debugPrint('GO -> reset-password');
    await _safeGo(tester, '/reset-password');
    debugPrint('GO -> reset-password');
    await _captureWithTimeout(binding, tester, '04_reset_password_page');

    // ---- AUTH-GATED SCREENS (9) ----
    // Flip auth back to authorized + ensure user is loaded so the
    // redirect lets us into the app.
    testAuthBloc.setAuthorized();
    testUserBloc.setLoaded();
    await _settle(tester);

    await _safeGo(tester, '/discovery', live: true);
    await _captureWithTimeout(binding, tester, '05_discovery_page', live: true);

    // ---- DISCOVERY: filter modal sheet (overlay on top of discovery) ----
    final BuildContext? rootCtx =
        _router.routerDelegate.navigatorKey.currentContext;
    if (rootCtx != null) {
      unawaited(
        MatchesFiltersModalSheet.show(
          rootCtx,
          initialOptions: const MatchesFilter(),
        ),
      );
      await _settleLive(tester);
      await _captureWithTimeout(
        binding,
        tester,
        '06_discovery_filter_modal',
        live: true,
      );
      // Dismiss the sheet so it does not block subsequent navigation.
      if (rootCtx.mounted) {
        Navigator.of(rootCtx, rootNavigator: true).pop();
      }
      await _settleLive(tester);
    } else {
      debugPrint('skipped 06_discovery_filter_modal: no root context');
      _failedCaptures.add('06_discovery_filter_modal');
    }

    await _safeGo(tester, '/matches', live: true);
    await _captureWithTimeout(binding, tester, '07_matches_page', live: true);

    await _safeGo(
      tester,
      '/match-result?match-id=hero-user-uid_partner-user-uid',
      live: true,
    );
    await _captureWithTimeout(
      binding,
      tester,
      '08_match_result_page',
      live: true,
    );

    await _safeGo(tester, '/matches/chat-hero-partner', live: true);
    await _captureWithTimeout(binding, tester, '09_chat_page', live: true);

    await _safeGo(
      tester,
      '/matches/chat-hero-partner/partner-user-uid',
      live: true,
    );
    await _captureWithTimeout(
      binding,
      tester,
      '10_user_profile_page',
      live: true,
    );

    await _safeGo(tester, '/profile', live: true);
    await _captureWithTimeout(binding, tester, '11_profile_tab', live: true);

    await _safeGo(tester, '/edit-profile-page', live: true);
    await _captureWithTimeout(
      binding,
      tester,
      '12_edit_profile_page',
      live: true,
    );

    await _safeGo(tester, '/edit-profile-page/looking-for-edit', live: true);
    await _captureWithTimeout(
      binding,
      tester,
      '13_edit_looking_for_page',
      live: true,
    );

    await _safeGo(tester, '/notification', live: true);
    await _captureWithTimeout(
      binding,
      tester,
      '14_notification_page',
      live: true,
    );

    // ---- ONBOARDING (2) ----
    // Flip the user bloc to noData so the router-redirect bounces
    // any auth-gated route through /onboard-about.
    testUserBloc.setNoData();
    await _settle(tester);

    await _safeGo(tester, '/onboard-about', live: true);
    await _captureWithTimeout(
      binding,
      tester,
      '15_onboard_about_you_page',
      live: true,
    );

    await _safeGo(tester, '/onboard', live: true);
    await _captureWithTimeout(
      binding,
      tester,
      '16_onboard_survey_page',
      live: true,
    );

    // Restore for any subsequent step.
    testUserBloc.setLoaded();

    // Surface any silent capture failures.
    expect(
      _failedCaptures,
      isEmpty,
      reason: 'These screenshots failed: $_failedCaptures',
    );
  });
}
