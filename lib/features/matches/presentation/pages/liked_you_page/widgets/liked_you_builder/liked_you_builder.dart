import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../subscription/presentation/dialogs/paywall_modal_sheet/paywall_modal_sheet.dart';
import '../../../../../domain/models/liked_you/liked_you_item.dart';
import '../../../../../domain/models/liked_you/liked_you_quota.dart';
import '../liked_you_card/liked_you_card.dart';
import '../liked_you_quota_banner/liked_you_quota_banner.dart';
import '../load_more_footer/load_more_footer.dart';

class LikedYouBuilder extends StatefulWidget {
  final List<LikedYouItem> items;
  final LikedYouQuota? quota;
  final bool isLoadingMore;
  final bool isLoadMoreFailed;
  final VoidCallback onReachToEnd;
  final VoidCallback onRetryLoadMore;

  const LikedYouBuilder({
    super.key,
    required this.items,
    required this.quota,
    required this.isLoadingMore,
    required this.isLoadMoreFailed,
    required this.onReachToEnd,
    required this.onRetryLoadMore,
  });

  @override
  State<LikedYouBuilder> createState() => _LikedYouBuilderState();
}

class _LikedYouBuilderState extends State<LikedYouBuilder> {
  final ScrollController _scrollController = ScrollController();
  bool _isPaywallOpen = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.reachToEnd) {
      widget.onReachToEnd();
    }
  }

  Future<void> _onShowPaywall() async {
    if (_isPaywallOpen) return;
    _isPaywallOpen = true;
    await PaywallModalSheet.show(context);
    _isPaywallOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    final quota = widget.quota;
    final hasBanner = quota != null;
    final hasFooter = widget.isLoadingMore || widget.isLoadMoreFailed;
    final itemCount =
        widget.items.length + (hasBanner ? 1 : 0) + (hasFooter ? 1 : 0);

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      itemCount: itemCount,
      separatorBuilder: (_, _) => const Gap(16.0),
      itemBuilder: (context, index) {
        var localIndex = index;

        if (hasBanner) {
          if (localIndex == 0) {
            return HorizontalPadding(
              child: LikedYouQuotaBanner(
                quota: quota,
                onUpgrade: _onShowPaywall,
              ),
            );
          }
          localIndex -= 1;
        }

        if (localIndex < widget.items.length) {
          final item = widget.items[localIndex];
          return HorizontalPadding(
            child: LikedYouCard(
              item: item,
              onTapLocked: item.isLocked ? _onShowPaywall : null,
            ),
          );
        }

        return HorizontalPadding(
          child: LoadMoreFooter(
            isFailed: widget.isLoadMoreFailed,
            onRetry: widget.onRetryLoadMore,
          ),
        );
      },
    );
  }
}
