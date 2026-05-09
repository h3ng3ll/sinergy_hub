import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/models/user_data/user_data.dart';

class UserDataMapper {
  static List<UserData> fromSnapshotList(
    QuerySnapshot snap,
  ) {
    return snap.docs
        .map(fromDocSnapshot)
        .whereType<UserData>()
        .toList();
  }

  static UserData? fromDocSnapshot(
    DocumentSnapshot snapshot,
  ) {
    if (!snapshot.exists || snapshot.data() == null) return null;
    return UserData.fromJson(
      Map<String, dynamic>.from(
        snapshot.data() as Map<String, dynamic>,
      )..['uid'] = snapshot.id,
    );
  }
}
