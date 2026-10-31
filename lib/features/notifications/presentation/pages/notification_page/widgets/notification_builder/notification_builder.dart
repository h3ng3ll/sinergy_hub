import 'package:flutter/material.dart' hide Notification;
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';

import '../../../../../domain/models/notification/notification.dart';
import '../../../../../../../core/widgets/wide/staggered_entrance.dart';
import 'build_notification_item.dart';
import 'notification_card.dart';

/// Total length of the staggered entrance of the first rows.
const Duration _kEntranceDuration = Duration(milliseconds: 900);

class NotificationBuilder extends StatefulWidget {
  final List<Notification> notifications;
  final Function(Notification) onTap;
  final VoidCallback onEndReached;

  /// Tablet/desktop: card rows with a staggered entrance.
  final bool wide;

  const NotificationBuilder({
    super.key,
    required this.notifications,
    required this.onTap,
    required this.onEndReached,
    this.wide = false,
  });

  @override
  State<NotificationBuilder> createState() => _NotificationBuilderState();
}

class _NotificationBuilderState extends State<NotificationBuilder>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: _kEntranceDuration,
  )..forward();

  @override
  void dispose() {
    _entrance.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.reachToEnd) {
        widget.onEndReached();
      }
    });
    super.initState();
  }

  Widget _buildWideItem(BuildContext context, int index) {
    return StaggeredEntrance(
      animation: _entrance,
      index: index,
      child: NotificationCard(
        notification: widget.notifications[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.wide) {
      return ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 32.0,
        ),
        itemCount: widget.notifications.length,
        itemBuilder: _buildWideItem,
        separatorBuilder: (_, _) => const SizedBox(
          height: 12.0,
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.notifications.length,
      itemBuilder: (context, index) {
        final notification = widget.notifications[index];

        return BuildNotificationItem(
          notification: notification,
          onTap: () => widget.onTap(
            notification,
          ),
        );
      },
      separatorBuilder: (_, _) => Gap(
        4.0,
      ),
    );
  }
}
