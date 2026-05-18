import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/image_service.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/user/domain/failures/user_update_failure.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_storage_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_write_repository.dart';
import 'package:sinergy_hub/features/user/domain/usecases/update_user_usecase.dart';

class MockUserWriteRepository extends Mock implements IUserWriteRepository {}

class MockUserStorageRepository extends Mock
    implements IUserStorageRepository {}

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockImageService extends Mock implements ImageService {}

void main() {
  late MockUserWriteRepository writeRepo;
  late MockUserStorageRepository storageRepo;
  late MockAuthRepository authRepo;
  late MockImageService imageService;
  late UpdateUserUseCase useCase;

  const uid = 'uid-1';

  setUpAll(() {
    registerFallbackValue(UserData.none());
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    writeRepo = MockUserWriteRepository();
    storageRepo = MockUserStorageRepository();
    authRepo = MockAuthRepository();
    imageService = MockImageService();

    useCase = UpdateUserUseCase(
      userWriteRepository: writeRepo,
      userStorageRepository: storageRepo,
      authRepository: authRepo,
      imageService: imageService,
    );

    when(() => authRepo.requireUserId()).thenAnswer((_) async => uid);
    when(
      () => writeRepo.update(userData: any(named: 'userData')),
    ).thenAnswer((_) async {});
  });

  group('UpdateUserUseCase', () {
    test(
      'when img is null, does not touch storage and keeps existing avatar fields',
      () async {
        final user = UserData.none().copyWith(
          uid: uid,
          firstName: 'тест',
          avatarPath: null,
          avatarUrl: 'https://legacy-avatar.example/img.jpg',
        );

        final result = await useCase.call(user, null);

        expect(result.isLeft(), isTrue);
        verifyNever(
          () => storageRepo.getAvatarUrl(
            avatarPath: any(named: 'avatarPath'),
          ),
        );
        verifyNever(
          () => storageRepo.updateAvatar(
            uid: any(named: 'uid'),
            avatar: any(named: 'avatar'),
          ),
        );
        verifyNever(
          () => storageRepo.deleteAvatar(path: any(named: 'path')),
        );
        verify(
          () => writeRepo.update(
            userData: any(
              named: 'userData',
              that: isA<UserData>()
                  .having(
                    (u) => u.avatarUrl,
                    'avatarUrl',
                    'https://legacy-avatar.example/img.jpg',
                  )
                  .having((u) => u.avatarPath, 'avatarPath', null)
                  .having((u) => u.firstName, 'firstName', 'тест'),
            ),
          ),
        ).called(1);
      },
    );

    test(
      'uploads new avatar, resolves URL, then updates user',
      () async {
        final compressed = Uint8List.fromList([1, 2, 3]);
        const newPath = 'users/uid-1/avatar_new.jpeg';
        const newUrl = 'https://avatar.example/new.jpeg';

        when(() => imageService.compressToTargetSize(any()))
            .thenAnswer((_) async => compressed);
        when(
          () => storageRepo.updateAvatar(
            uid: any(named: 'uid'),
            avatar: any(named: 'avatar'),
          ),
        ).thenAnswer((_) async => newPath);
        when(
          () => storageRepo.getAvatarUrl(avatarPath: any(named: 'avatarPath')),
        ).thenAnswer((_) async => newUrl);

        final user = UserData.none().copyWith(uid: uid);
        final result = await useCase.call(user, Uint8List.fromList([9]));

        expect(result.isLeft(), isTrue);
        verify(
          () => storageRepo.getAvatarUrl(avatarPath: newPath),
        ).called(1);
        verify(
          () => writeRepo.update(
            userData: any(
              named: 'userData',
              that: isA<UserData>()
                  .having((u) => u.avatarPath, 'avatarPath', newPath)
                  .having((u) => u.avatarUrl, 'avatarUrl', newUrl),
            ),
          ),
        ).called(1);
      },
    );

    test(
      'returns UserUpdateFailure when storage throws',
      () async {
        when(() => imageService.compressToTargetSize(any()))
            .thenAnswer((_) async => Uint8List.fromList([1]));
        when(
          () => storageRepo.updateAvatar(
            uid: any(named: 'uid'),
            avatar: any(named: 'avatar'),
          ),
        ).thenThrow(Exception('storage offline'));

        final user = UserData.none().copyWith(uid: uid);
        final result = await useCase.call(user, Uint8List.fromList([9]));

        expect(result.isRight(), isTrue);
        final failure = result.fold(
          (_) => throw StateError('expected Right'),
          (r) => r,
        );
        expect(failure, isA<UserUpdateFailure>());
        verifyNever(
          () => writeRepo.update(userData: any(named: 'userData')),
        );
      },
    );
  });
}
