import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../core/widgets/wide/hover_card.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../domain/models/notification/notification.dart';
import '../../bloc/notification_bloc/notification_bloc.dart';
import 'widgets/failed_notifications/failed_notifications.dart';
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
            AppLocalizations.of(context)!.notifications_title,
            style: textTheme.bold24.copyWith(color: AppColors.white.value),
          ),
        ),
        body: ResponsiveHelper.isMobile(context)
            ? _buildMobileBody(textTheme)
            : _buildWideBody(textTheme),
      ),
    );
  }

  Widget _buildWideBody(AppTextTheme textTheme) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state.isLoading && state.notifications.isEmpty) {
          return const CustomLoadingIndicator();
        }
        if (state.isFailed || state.notifications.isEmpty) {
          return Center(
            child: HorizontalPadding(
              child: HoverCard(
                padding: const EdgeInsets.all(32.0),
                child: state.isFailed
                    ? FailedNotifications(
                        errorMessage: state.errorMessage,
                      )
                    : NoFoundNotifications(),
              ),
            ),
          );
        }
        return HorizontalPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              Expanded(
                child: NotificationBuilder(
                  wide: true,
                  notifications: state.notifications,
                  onTap: onTap,
                  onEndReached: onEndReached,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileBody(AppTextTheme textTheme) {
    return Container(
      color: AppColors.white.value,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state.isFailed) {
            return FailedNotifications(
              errorMessage: state.errorMessage,
            );
          }
          if (state.isLoading && state.notifications.isEmpty) {
            return const CustomLoadingIndicator();
          }
          if (state.notifications.isEmpty) {
            return NoFoundNotifications();
          }
          return Column(
            children: [
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
    );
  }
}
