

import '../../../matches/domain/models/matches_filter/matches_filter.dart';
import '../../domain/models/user_data/user_data.dart';
import '../../domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/repositories/i_user_read_repository.dart';
import '../../domain/services/i_app_mode_service.dart';

class UserReadCompositeRepository implements IUserReadRepository {
  final IUserReadRepository real;
  final IUserReadRepository fake;
  final IAppModeService _modeService;

  UserReadCompositeRepository({
    required this.real,
    required this.fake,
    required IAppModeService modeService,
  }) : _modeService = modeService;

  Future<IUserReadRepository> _repo() async {
    final hasCompletedMatch = await _modeService.isTutorialMatchMode();

    return hasCompletedMatch ? fake : real;
  }

  @override
  Future<UserDataPgState> get({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  }) async {
    final repo = await _repo();
    return repo.get(
      userDataState: userDataState,
      filter: filter,
    );
  }

  @override
  Future<UserData?> getUserById({
    required String id,
  }) async {
    final repo = await _repo();
    return repo.getUserById(
      id: id,
    );
  }

  @override
  Future<List<UserData>> getUsersById({
    required List<String> ids,
  }) async {
    final repo = await _repo();

    return repo.getUsersById(
      ids: ids,
    );
  }

  @override
  Stream<UserData?> userDataStream(String uid) async* {
    final repo = await _repo();

    yield* repo.userDataStream(
      uid,
    );
  }
}
