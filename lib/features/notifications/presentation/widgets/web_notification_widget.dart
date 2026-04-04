import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../core/resources/colors/app_colors.dart';
import '../../../../core/resources/text/app_text_theme.dart';
import '../../../../core/resources/translations/app_localizations.dart';
import '../../../../core/widgets/build_user_avatar.dart';

class WebNotificationWidget extends StatefulWidget {
  final String title;
  final String body;
  final String? imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  const WebNotificationWidget({
    super.key,
    required this.title,
    required this.body,
    this.imageUrl,
    this.onTap,
    this.onDismiss,
  });

  @override
  State<WebNotificationWidget> createState() => _WebNotificationWidgetState();
}

class _WebNotificationWidgetState extends State<WebNotificationWidget> {
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _startAutoDismissTimer();
  }

  void _startAutoDismissTimer() {
    _autoDismissTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        widget.onDismiss?.call();
      }
    });
  }

  void _cancelAutoDismissTimer() {
    _autoDismissTimer?.cancel();
  }

  @override
  void dispose() {
    _cancelAutoDismissTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final lo = AppLocalizations.of(context)!;

    return MouseRegion(
      onEnter: (_) => _cancelAutoDismissTimer(),
      onExit: (_) => _startAutoDismissTimer(),
      child: GestureDetector(
        onTap: () {
          _cancelAutoDismissTimer();
          widget.onTap?.call();
        },
        child: Container(
          width: 380,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.white.value,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.value.withValues(alpha: 0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                  child: Column(
                    spacing: 4.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        spacing: 8.0,
                        children: [
                          Expanded(
                            child: Text(
                              widget.title,
                              style: textTheme.medium14.copyWith(
                                color: AppColors.black.value,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            lo.notificationNow,
                            style: textTheme.regular12.copyWith(
                              color: AppColors.greyLight.value,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.body,
                        style: textTheme.regular14.copyWith(
                          color: AppColors.jacarta.value,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              _buildCloseButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: BuildUserAvatar(
        url: widget.imageUrl,
        width: 40,
        height: 40,
      ),
    );
  }

  Widget _buildCloseButton() {
    return GestureDetector(
      onTap: () {
        _cancelAutoDismissTimer();
        widget.onDismiss?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          Assets.icons.close,
          width: 18,
          height: 18,
          colorFilter: ColorFilter.mode(
            AppColors.greyLight.value,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
