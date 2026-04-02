import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';

import '../../../../core/services/firebase/firebase_auth_service.dart';
import '../../../../core/services/firebase/firebase_realtime_db_service.dart';
import '../../domain/services/i_presence_service.dart';

class PresenceService implements IPresenceService {
  final FirebaseRealtimeDbService _firebaseRealtimeDbService;
  final FirebaseAuthService _firebaseAuthService;

  PresenceService({
    required FirebaseRealtimeDbService firebaseRealtimeDbService,
    required FirebaseAuthService firebaseAuthService,
  }) : _firebaseRealtimeDbService = firebaseRealtimeDbService,
       _firebaseAuthService = firebaseAuthService;

  DatabaseReference userStatusRef(String uid) =>
      _firebaseRealtimeDbService.database.ref(
        'status/$uid',
      );

  @override
  Future<void> init() async {
    final user = _firebaseAuthService.currentUser;
    if (user == null) return;

    final connectionRef = _firebaseRealtimeDbService.database.ref(
      '.info/connected',
    );
    connectionRef.onValue.listen(
      (event) async {
        final isConnected = event.snapshot.value as bool? ?? false;
        if (!isConnected) return;
        await userStatusRef(
          user.uid,
        ).onDisconnect().set({
          'state': 'offline',
          'last_seen': ServerValue.timestamp,
        });
        await userStatusRef(
          user.uid,
        ).set({
          'state': 'online',
          'last_seen': ServerValue.timestamp,
        });
      },
    );
  }

  @override
  Future<void> onChangeState(AppLifecycleState state) async {
    final user = _firebaseAuthService.currentUser;
    if (user == null) return;

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached ||
        state == AppLifecycleState.hidden) {
      await userStatusRef(
        user.uid,
      ).set({
        'state': 'offline',
        'last_seen': ServerValue.timestamp,
      });
    } else if (state == AppLifecycleState.resumed) {
      await userStatusRef(
        user.uid,
      ).set({
        'state': 'online',
        'last_seen': ServerValue.timestamp,
      });
    }
  }
}
