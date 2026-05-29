import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../bloc/settings_notification_bloc/settings_notification_bloc.dart';
import 'widgets/notification_toggle_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsNotificationBloc _settingsNotificationBloc =
      getIt<SettingsNotificationBloc>()
        ..add(const SettingsNotificationEvent.load());

  @override
  void dispose() {
    _settingsNotificationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return BuildAnimatedBackground(
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Settings',
            style: textTheme.bold24.copyWith(
              color: AppColors.white.value,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider<SettingsNotificationBloc>.value(
          value: _settingsNotificationBloc,
          child: BlocConsumer<SettingsNotificationBloc,
              SettingsNotificationState>(
            listenWhen: (p, c) => p.status != c.status && c.isFailed,
            listener: (context, state) {
              UiMessageService.showError(
                state.errorMessage,
              );
            },
            builder: (context, state) {
              if (state.isInitial || state.isLoading) {
                return const LoadingDataWidget();
              }
              return HorizontalPadding(
                child: ListView(
                  children: [
                    NotificationToggleTile(
                      enabled: state.enabledNotifications,
                      onChanged: (value) =>
                          _settingsNotificationBloc.add(
                            SettingsNotificationEvent.toggle(
                              enabled: value,
                            ),
                          ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
