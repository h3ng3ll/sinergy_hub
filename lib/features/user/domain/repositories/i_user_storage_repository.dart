import 'dart:typed_data';

import '../models/user_data/user_data.dart';

abstract class IUserStorageRepository {
  Future<String> updateAvatar({
    required String uid,
    required Uint8List avatar,
  });

  Future<void> deleteAvatar({
    required String path,
  });

  Future<String> getAvatarUrl(
    UserData user,
  );
}
