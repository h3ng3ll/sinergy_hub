import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../../../../domain/models/chat_message/chat_message.dart';

class BuildMessage extends StatelessWidget {
  final ChatMessage? message;
  final UserData user;
  final bool isSentByCurUser;
  final bool isLoadingStub;

  const BuildMessage({
    super.key,
    this.message,
    required this.isSentByCurUser,
    required this.user,
    this.isLoadingStub = false,
  });

  factory BuildMessage.loading({
    required UserData user,
  }) => BuildMessage(
    isSentByCurUser: false,
    user: user,
    isLoadingStub: true,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    final radius = Radius.circular(
      17.5,
    );
    return Align(
      alignment: isSentByCurUser ? Alignment.centerRight : Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth * 0.75,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: isSentByCurUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Row(
                    mainAxisAlignment: isSentByCurUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isSentByCurUser) ...[
                        BuildUserAvatar(
                          url: user.avatarUrl,
                          width: 50.0,
                          height: 50.0,
                        ),
                        Gap(10.0),
                      ],
                      Container(
                        padding: EdgeInsets.all(
                          15.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSentByCurUser ? null : AppColors.white.value,
                          gradient: isSentByCurUser
                              ? AppGradients.bluePurple
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.value.withValues(
                                alpha: 0.3,
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
                        child: isLoadingStub
                            ? SizedBox(
                          // width: 80.0,
                          height: 20.0,
                              child: Lottie.asset(
                                  fit: BoxFit.cover,
                                  Assets.lottie.loadingDots,

                                ),
                            )
                            : Text(
                                message!.message,
                                style: textTheme.regular16.copyWith(
                                  color: isSentByCurUser
                                      ? colorScheme.onPrimary
                                      : AppColors.black.value,
                                ),
                              ),
                      ),
                    ],
                  ),
                  if (!isLoadingStub)
                    Text(
                      DateFormat('HH:mm').format(
                        message!.createdAt,
                      ),
                      textAlign: isSentByCurUser
                          ? TextAlign.end
                          : TextAlign.start,
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
