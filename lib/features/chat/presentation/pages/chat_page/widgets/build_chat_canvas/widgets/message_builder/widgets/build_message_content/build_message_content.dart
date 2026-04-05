import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../../../core/utils/extensions/string_x.dart';
import '../../../../../../../../../../../gen/assets.gen.dart';
import '../../../../../../../../../domain/models/chat_message/chat_message.dart';
import '../../../../../../../../../domain/models/text_type/text_type.dart';

class BuildMessageContent extends StatelessWidget {
  final ChatMessage? message;
  final bool isSentByCurUser;
  final bool isLoadingStub;
  final Function(String) onTapUrl;
  final Function(String) onTapEmail;

  const BuildMessageContent({
    super.key,
    this.message,
    required this.isSentByCurUser,
    required this.isLoadingStub,
    required this.onTapUrl,
    required this.onTapEmail,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    if (isLoadingStub) {
      return SizedBox(
        height: 20.0,
        child: Lottie.asset(
          fit: BoxFit.cover,
          Assets.lottie.loadingDots,
        ),
      );
    }
    if (message == null) {
      return SizedBox.shrink();
    }
    return RichText(
      softWrap: true,
      text: TextSpan(
        children: message!.message.parseChatMessage().map((part) {
          return part.when(
            text: (value) => TextSpan(
              text: value,
              style: textTheme.regular16.copyWith(
                color: isSentByCurUser
                    ? colorScheme.onPrimary
                    : AppColors.black.value,
              ),
            ),

            url: (url) => WidgetSpan(
              child: GestureDetector(
                onTap: () => onTapUrl(url),
                child: Text(
                  url,
                  style: TextStyle(
                    color: AppColors.white.value,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),

            email: (email) => WidgetSpan(
              child: GestureDetector(
                onTap: () => onTapEmail(
                  email,
                ),
                child: Text(
                  email,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
