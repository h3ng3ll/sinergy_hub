import 'dart:typed_data';

import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class UpdateUserUseCase {
  final IUserRepository _userRepository;

  UpdateUserUseCase({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> call(
    UserData userData,
    Uint8List? img,
  ) async {
    if (img != null) {
      final avatarUrl = await _userRepository.updateAvatar(
        uid: userData.uid,
        avatar: img,
      );
      if (userData.avatarUrl != null) {
        await _userRepository.deleteAvatar(
          uid: userData.uid,
          name: userData.avatarUrl!,
        );
      }
      userData = userData.copyWith(
        avatarUrl: avatarUrl,
      );
    }
    await _userRepository.update(
      userData: userData,
    );
  }
}
