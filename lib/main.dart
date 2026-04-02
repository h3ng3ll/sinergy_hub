import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/bloc/app_observer.dart';
import 'core/di/injection.dart';
import 'core/resources/app_locale.dart';
import 'core/resources/app_theme.dart';
import 'core/routes/init_router/init_router.dart';
import 'core/services/firebase/firebase_auth_service.dart';
import 'core/services/firebase/firebase_firestore_service.dart';
import 'core/services/firebase/firebase_messaging_service.dart';
import 'core/services/google_sign_in_service/google_sign_in_service.dart';
import 'core/services/local_notification_service.dart';
import 'features/auth/domain/repostories/i_auth_repository.dart';
import 'features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/chat/domain/services/i_presence_service.dart';
import 'features/notifications/domain/usecases/get_notification_config_use_case.dart';
import 'features/notifications/domain/usecases/save_notification_config_use_case.dart';
import 'features/notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';
import 'features/user/domain/repositories/i_user_repository.dart';
import 'features/user/presentation/bloc/skills_bloc/skills_bloc.dart';
import 'features/user/presentation/bloc/user_bloc/user_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(
    fileName: '.env',
  );

  await initDependencies();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  //
  // /// ios did not configured
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await getIt<FirebaseAuthService>().init();
  await getIt<FirebaseFirestoreService>().init();
  await getIt<LocalNotificationService>().init();


  await getIt<FirebaseMessagingService>().init();
  await getIt<GoogleSignInService>().init();
  await getIt<IPresenceService>().init();
  Bloc.observer = AppObserver.instance();

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
  bool initialized = false;
  late final UserBloc userBloc;
  late final AuthBloc authBloc;

  // late final
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    loadData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    getIt<IPresenceService>().onChangeState(
      state,
    );
  }

  void loadData() async {
    userBloc = UserBloc(
      userRepository: getIt<IUserRepository>(),
    );
    authBloc =
        AuthBloc(
            authRepository: getIt<IAuthRepository>(),
            signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
          )
          ..add(
            AuthEvent.init(),
          )
          ..add(
            AuthEvent.listen(),
          );
    initialized = true;
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(
      this,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return Container();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>.value(
          value: userBloc,
        ),
        BlocProvider<SkillsBloc>(
          create: (_) => getIt<SkillsBloc>()
            ..add(
              SkillsEvent.fetch(),
            ),
        ),
        BlocProvider<AuthBloc>.value(
          value: authBloc,
        ),
        BlocProvider(
          create: (_) => NotificationConfigBloc(
            getNotificationsConfigUseCase:
                getIt<GetNotificationsConfigUseCase>(),
            saveNotificationsConfigUseCase:
                getIt<SaveNotificationsConfigUseCase>(),
            firebaseMessagingService: getIt<FirebaseMessagingService>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.authorized && state.uid != null) {
                userBloc.add(UserEvent.init(uid: state.uid!));

                context.read<NotificationConfigBloc>().add(
                  NotificationConfigEvent.init(),
                );
              }

              if (state.status == AuthStatus.logout) {
                userBloc.add(UserEvent.reset());
              }
            },
            child: BlocListener<UserBloc, UserState>(
              listenWhen: (previous, current) {
                return previous.status != current.status &&
                    current.status == UserStatus.noData;
              },
              listener: (context, state) {
                // Don't auto-logout - user might be new and hasn't completed onboarding
                // Navigate to onboarding instead
                if (state.isNoData && authBloc.state.isAuthorized) {
                  OnboardAboutYouPageRoute().go(
                    context,
                  );
                }
              },
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
                  routerConfig: initRouter,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
