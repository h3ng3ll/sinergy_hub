import 'package:flutter/material.dart' hide Notification;

import '../../../../../domain/models/notification/notification.dart';


class NotificationBuilder extends StatefulWidget {
  final List<Notification> notifications;

  const NotificationBuilder({
    super.key,
    required this.notifications,
  });

  @override
  State<NotificationBuilder> createState() => _NotificationBuilderState();
}

class _NotificationBuilderState extends State<NotificationBuilder> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notifications.length,
      itemBuilder: (context, index) {
        final notification = widget.notifications[index];

      },
    );
  }
}
