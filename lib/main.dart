import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/bloc/app_observer.dart';
import 'core/di/injection.dart';
import 'core/hive/hive_initializer.dart';
import 'core/resources/app_locale.dart';
import 'core/resources/app_theme.dart';
import 'core/resources/translations/app_localizations.dart';
import 'core/routes/init_router/init_router.dart';
import 'core/services/connectivity_service.dart';
import 'core/services/ui_message_service.dart';
import 'core/services/firebase/firebase_auth_service.dart';
import 'core/services/firebase/firebase_firestore_service.dart';
import 'core/services/firebase/firebase_messaging_service.dart';
import 'core/services/google_sign_in_service/google_sign_in_service.dart';
import 'core/services/local_notification_service.dart';
import 'core/utils/env/env.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/chat/domain/services/i_presence_service.dart';
import 'features/connectivity/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'features/notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';
import 'features/onboard_survey/presentation/bloc/onboard_bloc/onboard_bloc.dart';
import 'features/user/presentation/bloc/skills_bloc/skills_bloc.dart';
import 'features/user/presentation/bloc/user_bloc/user_bloc.dart';
import 'firebase.dart';


void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initFirebase();

  await initHive();

  await initDependencies();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );


  if(!kIsWeb){
    /// Firebase doesn't support web
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      true,
    );
    FlutterError.onError =
        (
        FlutterErrorDetails details,
        ) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(
        details,
      );
    };

    PlatformDispatcher.instance.onError =
        (
        error,
        stack,
        ) {
      FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        fatal: true,
      );
      return true;
    };
  }





  await getIt<ConnectivityService>().init();
  await getIt<FirebaseAuthService>().init();
  await getIt<FirebaseFirestoreService>().init();
  await getIt<LocalNotificationService>().init();

  await getIt<FirebaseMessagingService>().init();
  await getIt<GoogleSignInService>().init(
    getIt<Env>(),
  );
  await getIt<IPresenceService>().init();
  Bloc.observer = AppObserver.instance();

  FlutterNativeSplash.remove();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final GoRouter _router;
  bool _splashRemoved = false;

  // late final
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    _router = initRouter(
      authBloc: getIt<AuthBloc>(),
      userBloc: getIt<UserBloc>(),
      onboardBloc: getIt<OnboardBloc>(),
      connectivityBloc: getIt<ConnectivityBloc>(),
    );

    getIt<AuthBloc>()
      ..add(AuthEvent.init())
      ..add(AuthEvent.listen());
  }

  void _maybeRemoveSplash() {
    if (_splashRemoved) return;
    final auth = getIt<AuthBloc>().state;
    final onboard = getIt<OnboardBloc>().state;
    final ready = auth.isLogout ||
        (auth.isAuthorized && onboard.isLoaded);
    if (ready) {
      _splashRemoved = true;

    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    getIt<IPresenceService>().onChangeState(
      state,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(
      this,
    );
    getIt<ConnectivityService>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>.value(
          value: getIt<UserBloc>(),
        ),
        BlocProvider<SkillsBloc>(
          create: (_) => getIt<SkillsBloc>()
            ..add(
              SkillsEvent.fetch(),
            ),
        ),
        BlocProvider<AuthBloc>.value(
          value: getIt<AuthBloc>(),
        ),
        BlocProvider<OnboardBloc>.value(
          value: getIt<OnboardBloc>(),
        ),
        BlocProvider<ConnectivityBloc>.value(
          value: getIt<ConnectivityBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<NotificationConfigBloc>(),
        ),
      ],
      child: ResponsiveBreakpoints(
        breakpoints: [
          const Breakpoint(
            start: 0,
            end: 450,
            name: MOBILE,
          ),
          const Breakpoint(
            start: 451,
            end: 900,
            name: TABLET,
          ),
          const Breakpoint(
            start: 900,
            end: 1920,
            name: DESKTOP,
          ),
          const Breakpoint(
            start: 1921,
            end: double.infinity,
            name: '4K',
          ),
        ],
        child: MaterialApp.router(
          theme: AppThemeData.light,
          supportedLocales: AppLocale.supportedLocales,
          locale: AppLocale.startLocale,
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          builder: (context, child) {
            return MultiBlocListener(
              listeners: [
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.isAuthorized && state.uid != null) {
                      getIt<UserBloc>().add(
                        UserEvent.init(uid: state.uid!),
                      );
                      context.read<NotificationConfigBloc>().add(
                        NotificationConfigEvent.init(),
                      );
                      getIt<OnboardBloc>().add(
                        OnboardEvent.load(),
                      );
                    }
                    if (state.isLogout) {
                      getIt<UserBloc>().add(
                        UserEvent.reset(),
                      );
                      getIt<OnboardBloc>().add(
                        OnboardEvent.reset(),
                      );
                    }
                    _maybeRemoveSplash();
                  },
                ),
                BlocListener<OnboardBloc, OnboardState>(
                  listenWhen: (p, c) => p.status != c.status,
                  listener: (context, _) => _maybeRemoveSplash(),
                ),
                BlocListener<ConnectivityBloc, ConnectivityState>(
                  listenWhen: (p, c) => p.isOffline && c.isOnline,
                  listener: (context, _) {
                    UiMessageService.showSuccess(
                      AppLocalizations.of(context)!.connection_restored,
                    );
                  },
                ),
              ],
              child: child ?? SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
