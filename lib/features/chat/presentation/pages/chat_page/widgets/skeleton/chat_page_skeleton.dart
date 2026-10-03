import 'package:flutter/material.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../../core/widgets/shimmer/app_shimmer.dart';
import '../../../../../../../core/widgets/shimmer/shimmer_box.dart';
import '../build_chat_bottom/widgets/build_chat_bottom_container.dart';
import 'chat_messages_skeleton.dart';

class ChatPageSkeleton extends StatelessWidget {
  const ChatPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.value,
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white.value,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.value.withValues(
                    alpha: 0.4,
                  ),
                  offset: const Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  spacing: 12.0,
                  children: [
                    SizedBox(
                      width: 50.0,
                      child: InkWell(
                        onTap: context.goBack,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.black.value,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: AppShimmer(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 12.0,
                            children: [
                              const ShimmerBox(
                                width: 40.0,
                                height: 40.0,
                                radius: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 6.0,
                                children: const [
                                  ShimmerBox(
                                    width: 120.0,
                                    height: 14.0,
                                  ),
                                  ShimmerBox(
                                    width: 70.0,
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: ChatMessagesSkeleton(),
          ),
          BuildChatBottomContainer(
            child: HorizontalPadding(
              child: AppShimmer(
                child: const ShimmerBox(
                  width: double.infinity,
                  height: 44.0,
                  radius: 22.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
