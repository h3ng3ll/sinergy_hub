import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sinergy_hub/firebase.dart';

// flutter run -t tool/cleanup_fcm_tokens.dart \
//   --web-port 5000 --web-hostname localhost \
//   --flavor=development \
//   --dart-define=DARTENV=development

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  final firestore = FirebaseFirestore.instance;
  final usersSnapshot = await firestore.collection('users').get();

  print('Found ${usersSnapshot.docs.length} users');

  var migrated = 0;
  var skipped = 0;

  for (final userDoc in usersSnapshot.docs) {
    final uid = userDoc.id;
    final configRef = firestore
        .collection('users')
        .doc(uid)
        .collection('notificationConfig')
        .doc('config');

    final configSnap = await configRef.get();
    if (!configSnap.exists) {
      skipped++;
      print('⏭️  $uid — no notificationConfig/config doc');
      continue;
    }

    final data = configSnap.data();
    if (data == null || !data.containsKey('fcmTokens')) {
      skipped++;
      print('⏭️  $uid — no fcmTokens field');
      continue;
    }

    await configRef.update({'fcmTokens': FieldValue.delete()});
    migrated++;
    print('✅ $uid — removed fcmTokens');
  }

  print('✅ Done. Migrated: $migrated, Skipped: $skipped');
  exit(0);
}
