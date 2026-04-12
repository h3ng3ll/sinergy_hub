import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/models/failures.dart';
import '../../../../core/services/image_service.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/user_update_failure.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class UpdateUserUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;
  final ImageService _imageService;

  UpdateUserUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
    required ImageService imageService,
  }) : _userRepository = userRepository,
       _authRepository = authRepository,
       _imageService = imageService;

  Future<Either<void, Failure>> call(
    UserData userData,
    Uint8List? img,
  ) async {
    try {
      final uid = await _authRepository.requireUserId();

      userData = userData.copyWith(uid: uid);

      String? oldAvatarPath = userData.avatarPath;
      String? newAvatarPath;

      /// 1. Upload first
      if (img != null) {
        img = await _imageService.compressToTargetSize(
          img,
        );
        newAvatarPath = await _userRepository.updateAvatar(
          uid: userData.uid,
          avatar: img,
        );

        userData = userData.copyWith(
          avatarPath: newAvatarPath,
        );
      }
      final url = await _userRepository.getAvatarUrl(
        userData,
      );

      userData = userData.copyWith(
        avatarUrl: url,
      );

      /// 2. Update DB
      await _userRepository.update(
        userData: userData,
      );

      /// 3. Delete old avatar AFTER success
      if (oldAvatarPath != null && newAvatarPath != null) {
        await _userRepository.deleteAvatar(
          path: oldAvatarPath,
        );
      }

      return Left(null);
    } catch (_) {
      return Right(UserUpdateFailure());
    }
  }
}
