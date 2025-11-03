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
import 'features/user/domain/repositories/i_user_repository.dart';
import 'features/user/domain/usecases/update_user_usecase.dart';
import 'features/user/presentation/bloc/user_cubit/user_cubit.dart';
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

  Bloc.observer = AppObserver.instance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initialized = false;
  late final UserCubit userCubit;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final user = await getIt<IUserRepository>().currentUserFuture();
    userCubit = UserCubit(
      preloadUser: user,
      userRepository: getIt<IUserRepository>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
    );
    initialized = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return Container();
    }
    return BlocProvider<UserCubit>.value(
      value: userCubit,
      child: MaterialApp.router(
        theme: AppThemeData.light,
        supportedLocales: AppLocale.supportedLocales,
        locale: AppLocale.startLocale,
        routerConfig: initRouter,
      ),
    );
  }
}
