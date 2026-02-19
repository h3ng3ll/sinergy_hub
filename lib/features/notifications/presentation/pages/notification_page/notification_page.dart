import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../domain/models/notification/notification.dart';
import '../../bloc/notification_bloc/notification_bloc.dart';
import 'widgets/no_found_notifications/no_found_notifications.dart';
import 'widgets/notification_builder/notification_builder.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  void onTap(Notification notification) {}

  void onEndReached() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    return BuildAnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: Text(
            'Notifications',
            style: textTheme.bold24.copyWith(color: AppColors.white.value),
          ),
        ),
        body: Container(
          color: AppColors.white.value,
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state.notifications.isEmpty) {
                return NoFoundNotifications();
              }
              return Column(

                children: [
                  Gap(24.0),
                  Center(
                    child: Text(
                      'Notification Center',
                      style: textTheme.bold24,
                    ),
                  ),
                  Gap(24.0),
                  Expanded(
                    child: HorizontalPadding(
                      child: NotificationBuilder(
                        notifications: state.notifications,
                        onTap: onTap,
                        onEndReached: onEndReached,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
