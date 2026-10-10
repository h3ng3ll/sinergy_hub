import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../core/resources/colors/app_gradients.dart';
import '../../../../../../../../../../core/widgets/build_user_avatar.dart';
import '../../../../../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../../../../domain/models/chat_message/chat_message.dart';
import 'build_message_content/build_message_content.dart';

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
