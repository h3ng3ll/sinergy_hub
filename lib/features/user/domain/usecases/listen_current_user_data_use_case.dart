import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class ListenCurrentUserDataUseCase {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  ListenCurrentUserDataUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  }) : _userRepository = userRepository,
       _authRepository = authRepository;

  Stream<UserData?> call() async* {
    final uid = await _authRepository.requireUserId();
    yield* _userRepository.userDataStream(
      uid,
    );
  }
}
