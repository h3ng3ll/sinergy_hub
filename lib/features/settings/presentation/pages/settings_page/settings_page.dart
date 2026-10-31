import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../appearance/presentation/bloc/background_palette_bloc/background_palette_bloc.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../bloc/settings_notification_bloc/settings_notification_bloc.dart';
import '../../dialogs/palette_color_picker_sheet/palette_color_picker_sheet.dart';
import 'widgets/background_palette_section.dart';
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

  bool _isPaywallOpen = false;

  @override
  void dispose() {
    _settingsNotificationBloc.close();
    super.dispose();
  }

  BackgroundPaletteBloc get _paletteBloc =>
      context.read<BackgroundPaletteBloc>();

  Future<void> _onPickPrimary() async {
    final color = await _pickColor(_paletteBloc.state.primaryColor);
    if (color == null) return;
    _paletteBloc.add(BackgroundPaletteEvent.setPrimary(color: color));
  }

  Future<void> _onPickSecondary() async {
    final color = await _pickColor(_paletteBloc.state.secondaryColor);
    if (color == null) return;
    _paletteBloc.add(BackgroundPaletteEvent.setSecondary(color: color));
  }

  /// The palette is Premium-only: Free users get the paywall instead.
  Future<Color?> _pickColor(Color initialColor) async {
    if (!_paletteBloc.state.isPremium) {
      await _onShowPaywall();
      return null;
    }
    final color = await PaletteColorPickerSheet.show(
      initialColor: initialColor,
    );
    if (!mounted) return null;
    return color;
  }

  void _onResetPalette() {
    _paletteBloc.add(const BackgroundPaletteEvent.resetPalette());
  }

  Future<void> _onShowPaywall() async {
    if (_isPaywallOpen) return;
    _isPaywallOpen = true;
    await PaywallPageRoute().navigate(context);
    _isPaywallOpen = false;
  }

  void _onPaletteFailed(BuildContext context, BackgroundPaletteState state) {
    UiMessageService.showError(state.errorMessage);
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
          child:
              BlocConsumer<SettingsNotificationBloc, SettingsNotificationState>(
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

                  /// A save keeps the loaded settings on screen and only
                  /// overlays the indicator (blocking taps until it settles).
                  return Stack(
                    children: [
                      HorizontalPadding(
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
                            BlocConsumer<
                              BackgroundPaletteBloc,
                              BackgroundPaletteState
                            >(
                              listenWhen: (p, c) =>
                                  c.isFailed &&
                                  p.errorMessage != c.errorMessage,
                              listener: _onPaletteFailed,
                              builder: (context, paletteState) {
                                return BackgroundPaletteSection(
                                  primary: paletteState.primaryColor,
                                  secondary: paletteState.secondaryColor,
                                  isPremium: paletteState.isPremium,
                                  onTapPrimary: _onPickPrimary,
                                  onTapSecondary: _onPickSecondary,
                                  onReset:
                                      paletteState.isPremium &&
                                          paletteState.hasCustomPalette
                                      ? _onResetPalette
                                      : null,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      if (state.isSaving)
                        const Positioned.fill(
                          child: AbsorbPointer(
                            child: LoadingDataWidget(),
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
