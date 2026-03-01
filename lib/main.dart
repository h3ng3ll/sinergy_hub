import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/bloc/app_observer.dart';
import 'core/di/injection.dart';
import 'core/resources/app_locale.dart';
import 'core/resources/app_theme.dart';
import 'core/routes/init_router/init_router.dart';
import 'core/services/firebase/firebase_messaging_service.dart';
import 'core/services/local_notification_service.dart';
import 'core/services/ui_message_service.dart';
import 'features/auth/domain/repostories/i_auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/user/domain/repositories/i_user_repository.dart';
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

  await getIt<LocalNotificationService>().init();
  await getIt<FirebaseMessagingService>().init();

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

class _MyAppState extends State<MyApp> {
  bool initialized = false;
  late final UserBloc userBloc;
  late final AuthBloc authBloc;

  // late final
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    userBloc = UserBloc(
      userRepository: getIt<IUserRepository>(),
    );
    authBloc =
    AuthBloc(
      authRepository: getIt<IAuthRepository>(),
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
  Widget build(BuildContext context) {
    if (!initialized) {
      return Container();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>.value(
          value: userBloc,
        ),
        BlocProvider<AuthBloc>.value(
          value: authBloc,
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (p, n) =>
        (p.status == AuthStatus.authorized) ||
            (p.status == AuthStatus.logout),

        listener: (context, state) {
          if (state.status == AuthStatus.authorized) {
            userBloc.add(
              UserEvent.init(
                uid: state.uid!,
              ),
            );
            // OnboardAboutYouPageRoute().go(context);
          } else if (state.status == AuthStatus.logout) {
            userBloc.add(
              UserEvent.reset(),
            );
          }
        },
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state.isNoData && authBloc.state.isAuthorized) {
              UiMessageService.showError(
                'No data . Logout',
              );
              context.read<AuthBloc>().add(
                AuthEvent.signOut(),
              );
            }
          },
          child: MaterialApp.router(
            theme: AppThemeData.light,
            supportedLocales: AppLocale.supportedLocales,
            locale: AppLocale.startLocale,
            routerConfig: initRouter,
          ),
        ),
      ),
    );
  }
}
