import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../models/user_data/user_data.dart';
import '../repositories/i_user_repository.dart';

class ListenUserDataUseCase {
  final IUserRepository _userRepository;

  ListenUserDataUseCase({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  Stream<UserData?> call(String uid) async* {
    yield* _userRepository.userDataStream(
      uid,
    );
  }
}
