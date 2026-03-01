import 'dart:typed_data';

import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class UpdateUserUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  UpdateUserUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _userRepository = userRepository,
       _authRepository = authRepository;

  Future<void> call(
    UserData userData,
    Uint8List? img,
  ) async {
    final uid = await _authRepository.requireUserId();

    userData = userData.copyWith(
      uid: uid,
    );

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
