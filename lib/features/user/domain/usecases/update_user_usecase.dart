import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/services/image_service.dart';
import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../failures/user_update_failure.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_storage_repository.dart';
import '../repositories/i_user_write_repository.dart';

class UpdateUserUseCase {
  final IUserWriteRepository _userWriteRepository;
  final IUserStorageRepository _userStorageRepository;
  final IAuthRepository _authRepository;
  final ImageService _imageService;

  UpdateUserUseCase({
    required IUserWriteRepository userWriteRepository,
    required IUserStorageRepository userStorageRepository,
    required IAuthRepository authRepository,
    required ImageService imageService,
  }) : _userStorageRepository = userStorageRepository,
       _authRepository = authRepository,
       _imageService = imageService,
       _userWriteRepository = userWriteRepository;

  Future<Either<void, Failure>> call(
    UserData userData,
    Uint8List? img,
  ) async {
    try {
      final uid = await _authRepository.requireUserId();

      userData = userData.copyWith(uid: uid);

      final String? oldAvatarPath = userData.avatarPath;

      /// 1. If a new image was explicitly provided, upload it and refresh
      /// avatarPath + avatarUrl. Otherwise, keep avatarPath/avatarUrl that
      /// already live on the UserData model.
      if (img != null) {
        img = await _imageService.compressToTargetSize(
          img,
        );
        final newAvatarPath = await _userStorageRepository.updateAvatar(
          uid: userData.uid,
          avatar: img,
        );
        final newAvatarUrl = await _userStorageRepository.getAvatarUrl(
          avatarPath: newAvatarPath,
        );
        userData = userData.copyWith(
          avatarPath: newAvatarPath,
          avatarUrl: newAvatarUrl,
        );
      }

      /// 2. Update DB
      await _userWriteRepository.update(
        userData: userData,
      );

      /// 3. Delete old avatar AFTER success
      if (img != null && oldAvatarPath != null) {
        await _userStorageRepository.deleteAvatar(
          path: oldAvatarPath,
        );
      }

      return Left(null);
    } catch (_) {
      return Right(UserUpdateFailure());
    }
  }
}
