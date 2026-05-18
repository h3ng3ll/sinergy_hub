import 'dart:typed_data';

abstract class IUserStorageRepository {
  Future<String> updateAvatar({
    required String uid,
    required Uint8List avatar,
  });

  Future<void> deleteAvatar({
    required String path,
  });

  Future<String> getAvatarUrl({
    required String avatarPath,
  });
}
