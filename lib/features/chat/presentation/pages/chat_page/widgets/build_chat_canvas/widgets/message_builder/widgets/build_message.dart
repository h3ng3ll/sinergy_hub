import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../core/utils/initials.dart';
import '../../../../../../../../../../core/utils/responsive_helper.dart';
import '../../../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../../../../core/widgets/wide/avatar_ring.dart';
import '../../../../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../../../../domain/models/chat_message/chat_message.dart';
import 'build_message_content/build_message_content.dart';

/// Bubble width cap on tablet/desktop, so lines stay readable in wide panes.
const double _kWideBubbleMaxWidth = 560.0;

/// Incoming avatar size on tablet/desktop.
const double _kWideAvatarSize = 32.0;

/// Gradient ring + white gap around a small [AvatarRing] (2 + 2 per side).
const double _kWideRingInset = 8.0;

class BuildMessage extends StatelessWidget {
  final ChatMessage? message;
  final UserData user;
  final bool isSentByCurUser;
  final bool isLoadingStub;
  final Function(String) onTapUrl;
  final Function(String) onTapEmail;
  final VoidCallback? onTapUser;

  const BuildMessage({
    super.key,
    this.message,
    required this.isSentByCurUser,
    required this.user,
    this.isLoadingStub = false,
    required this.onTapUrl,
    required this.onTapEmail,
    this.onTapUser,
  });

  factory BuildMessage.loading({
    required UserData user,
    VoidCallback? onTapUser,
  }) => BuildMessage(
    isSentByCurUser: false,
    user: user,
    onTapUser: onTapUser,
    isLoadingStub: true,
    onTapUrl: (_) {},
    onTapEmail: (_) {},
  );

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(
      17.5,
    );
    final wide = !ResponsiveHelper.isMobile(context);
    final textTheme = AppTextTheme.of(context);
    final avatarSize = wide ? _kWideAvatarSize : 50.0;
    return Align(
      alignment: isSentByCurUser ? Alignment.centerRight : Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: wide
                  ? min(constraints.maxWidth * 0.75, _kWideBubbleMaxWidth)
                  : constraints.maxWidth * 0.75,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: isSentByCurUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                spacing: wide ? 4.0 : 10.0,
                children: [
                  Row(
                    crossAxisAlignment: wide
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.center,
                    mainAxisAlignment: isSentByCurUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isSentByCurUser) ...[
                        if (wide)
                          AvatarRing(
                            url: user.avatarUrl,
                            initials: initialsOf([
                              user.firstName,
                              user.lastName,
                            ]),
                            size: avatarSize,
                            showEditBadge: false,
                            onTap: onTapUser?.call,
                          )
                        else
                          BuildUserAvatar(
                            url: user.avatarUrl,
                            width: avatarSize,
                            height: avatarSize,
                            placeholderColor: AppColors.greyLight.value,
                            onTap: onTapUser?.call,
                          ),
                        Gap(10.0),
                      ],
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(
                            15.0,
                          ),
                          decoration: BoxDecoration(
                            color: isSentByCurUser
                                ? null
                                : wide
                                ? AppColors.antiFlashWhite.value
                                : AppColors.white.value,
                            gradient: isSentByCurUser
                                ? AppGradients.bluePurple
                                : null,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.value.withValues(
                                  alpha: wide ? 0.06 : 0.3,
                                ),
                                offset: Offset(
                                  -1,
                                  1,
                                ),
                                blurRadius: 3,
                                // spreadRadius: 1,
                              ),
                            ],
                            borderRadius: isSentByCurUser
                                ? BorderRadius.only(
                                    bottomLeft: radius,
                                    topLeft: radius,
                                    topRight: radius,
                                  )
                                : BorderRadius.only(
                                    bottomRight: radius,
                                    topLeft: radius,
                                    topRight: radius,
                                  ),
                          ),
                          child: BuildMessageContent(
                            message: message,
                            isSentByCurUser: isSentByCurUser,
                            isLoadingStub: isLoadingStub,
                            onTapUrl: onTapUrl,
                            onTapEmail: onTapEmail,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!isLoadingStub)
                    Padding(
                      padding: EdgeInsets.only(
                        left: wide && !isSentByCurUser
                            ? _kWideAvatarSize + _kWideRingInset + 10.0
                            : 0.0,
                      ),
                      child: Text(
                        DateFormat('HH:mm').format(
                          message!.createdAt,
                        ),
                        textAlign: isSentByCurUser
                            ? TextAlign.end
                            : TextAlign.start,
                        style: wide
                            ? textTheme.regular12.copyWith(
                                color: AppColors.darkBlueGray.value,
                              )
                            : null,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
