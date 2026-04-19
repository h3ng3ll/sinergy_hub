import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_read_repository.dart';

class ListenCurrentUserDataUseCase {
  final IUserReadRepository _userReadRepository;
  final IAuthRepository _authRepository;

  ListenCurrentUserDataUseCase({
    required IUserReadRepository userReadRepository,
    required IAuthRepository authRepository,
  }) : _userReadRepository = userReadRepository,
       _authRepository = authRepository;

  Stream<UserData?> call() async* {
    final uid = await _authRepository.requireUserId();
    yield* _userReadRepository.userDataStream(
      uid,
    );
  }
}
