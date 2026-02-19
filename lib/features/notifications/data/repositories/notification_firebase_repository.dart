import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../domain/models/notification/notification.dart';
import '../../domain/repositories/i_notification_repository.dart';

class NotificationFirebaseRepository implements INotificationRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;

  NotificationFirebaseRepository({
    required FirebaseFirestoreService firebaseFirestoreService,
  }) : _firebaseFirestoreService = firebaseFirestoreService;

  @override
  Future<Notification> create({
    required String uid,
    required Notification notification,
  }) async {
    final notificationsDoc = _firebaseFirestoreService.notifications(
      uid: uid,
    );

    final String id = notificationsDoc.doc().id;

    notification = notification.copyWith(
      id: id,
    );
    await notificationsDoc
        .doc(
          id,
        )
        .set(
          notification.toJson(),
        );

    return notification;
  }

  @override
  Future<List<Notification>> get({
    required String uid,
  }) async {
    final snapshots = await _firebaseFirestoreService
        .notifications(
          uid: uid,
        ).get();

    final notifications = snapshots.docs
        .map(
          (e) => Notification.fromJson(
            e.data(),
          ),
        )
        .toList();

    return notifications;
  }
}
