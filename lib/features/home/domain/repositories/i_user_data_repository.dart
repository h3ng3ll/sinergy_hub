

import '../models/user_data/user_data.dart';

abstract class IUserDataRepository {
  Future<List<UserData>> get();
}