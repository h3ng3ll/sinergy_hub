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
    required Notification notification,
  }) async {
    final String id = _firebaseFirestoreService.chats().doc().id;
    notification = notification.copyWith(
      id: id,
    );
    await _firebaseFirestoreService
        .chats()
        .doc(
          id,
        )
        .set(
          notification.toJson(),
        );

    return notification;
  }

  @override
  Future<List<Notification>> get() async {
    final snapshots = await _firebaseFirestoreService
        .notifications()
        .snapshots()
        .last;

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
