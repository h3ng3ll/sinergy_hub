import '../../../matches/domain/models/matches_filter/matches_filter.dart';
import '../models/user_data/user_data.dart';
import '../models/users_data_pg_state/users_data_pg_state.dart';

abstract class IUserReadRepository {
  Future<UserData?> getUserById({required String id});

  Future<List<UserData>> getUsersById({required List<String> ids});

  Stream<UserData?> userDataStream(String uid);

  Future<UserDataPgState> get({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  });
}
