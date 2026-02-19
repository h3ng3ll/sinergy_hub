import 'package:flutter/material.dart' hide Notification;
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/extensions/scroll_controller_ext.dart';
import '../../../../../domain/models/notification/notification.dart';
import 'build_notification_item.dart';

class NotificationBuilder extends StatefulWidget {
  final List<Notification> notifications;
  final Function(Notification) onTap;
  final VoidCallback onEndReached;

  const NotificationBuilder({
    super.key,
    required this.notifications,
    required this.onTap,
    required this.onEndReached,
  });

  @override
  State<NotificationBuilder> createState() => _NotificationBuilderState();
}

class _NotificationBuilderState extends State<NotificationBuilder> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.reachToEnd) {
        widget.onEndReached();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
