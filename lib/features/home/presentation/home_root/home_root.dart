import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../notifications/domain/usecases/get_notifications_use_case.dart';
import '../../../notifications/domain/usecases/save_notification_use_case.dart';
import '../../../notifications/presentation/bloc/notification_bloc/notification_bloc.dart';

class HomeRoot extends StatefulWidget {
  final Widget navigator;

  const HomeRoot({
    super.key,
    required this.navigator,
  });

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationBloc>(
          create: (_) =>
              NotificationBloc(
                getNotificationsUseCase: getIt<GetNotificationsUseCase>(),
                saveNotificationUseCase: getIt<SaveNotificationUseCase>(),
              )..add(
                NotificationEvent.get(),
              ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return widget.navigator;
        },
      ),
    );
  }
}
