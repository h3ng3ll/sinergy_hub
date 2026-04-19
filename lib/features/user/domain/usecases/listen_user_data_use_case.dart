import '../models/user_data/user_data.dart';
import '../repositories/i_user_read_repository.dart';

class ListenUserDataUseCase {
  final IUserReadRepository _userReadRepository;

  ListenUserDataUseCase({
    required IUserReadRepository userReadRepository,
  }) : _userReadRepository = userReadRepository;

  Stream<UserData?> call(String uid) async* {
    yield* _userReadRepository.userDataStream(
      uid,
    );
  }
}
