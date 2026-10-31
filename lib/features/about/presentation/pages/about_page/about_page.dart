import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/utils/app_config.dart';
import '../../../../../core/utils/platform_helper.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../core/widgets/wide/hover_card.dart';
import '../../../../../gen/assets.gen.dart';
import 'widgets/store_badge_button.dart';

/// Readable width of the About content.
const double _kContentMaxWidth = 640.0;

/// About tab: what the app is, its version, and — on web only — where to
/// download the native apps.
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late final Future<String> _version = PlatformHelper.getAppVersion();

  /// Opens the store listing in a new browser tab.
  Future<void> _openStore(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  }

  void _onAppStore() => _openStore(AppConfig.appStoreUrl);

  void _onGooglePlay() => _openStore(AppConfig.googlePlayUrl);

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;
    final white = AppColors.white.value;
    final hasAppStore = AppConfig.appStoreUrl.isNotEmpty;
    final hasGooglePlay = AppConfig.googlePlayUrl.isNotEmpty;
    final showStores = kIsWeb && (hasAppStore || hasGooglePlay);

    return Scaffold(
      backgroundColor: AppColors.transparent.value,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: _kContentMaxWidth,
            ),
            child: HorizontalPadding(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 20.0,
                children: [
                  HoverCard(
                    translucent: true,
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12.0,
                      children: [
                        Text(
                          lo.app_title,
                          style: textTheme.bold22.copyWith(
                            color: white,
                          ),
                        ),
                        Text(
                          lo.about_description,
                          style: textTheme.regular16.copyWith(
                            color: white.withValues(
                              alpha: 0.92,
                            ),
                            height: 1.5,
                          ),
                        ),
                        FutureBuilder<String>(
                          future: _version,
                          builder: (context, snapshot) => Text(
                            snapshot.hasData
                                ? lo.about_version(snapshot.data!)
                                : '',
                            style: textTheme.regular12.copyWith(
                              color: white.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showStores)
                    HoverCard(
                      translucent: true,
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16.0,
                        children: [
                          Text(
                            lo.about_download_title,
                            style: textTheme.bold17.copyWith(
                              color: white,
                            ),
                          ),
                          Text(
                            lo.about_download_subtitle,
                            style: textTheme.regular14.copyWith(
                              color: white.withValues(
                                alpha: 0.85,
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 12.0,
                            runSpacing: 12.0,
                            children: [
                              if (hasAppStore)
                                StoreBadgeButton(
                                  icon: Assets.icons.apple,
                                  caption: lo.about_app_store_caption,
                                  storeName: lo.about_app_store,
                                  onTap: _onAppStore,
                                ),
                              if (hasGooglePlay)
                                StoreBadgeButton(
                                  icon: Assets.icons.google,
                                  caption: lo.about_google_play_caption,
                                  storeName: lo.about_google_play,
                                  onTap: _onGooglePlay,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
