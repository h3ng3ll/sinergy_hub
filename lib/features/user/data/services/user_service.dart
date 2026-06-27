

class UserService {

  /// Accept uid1_uid2
  List<String> uidKeyToList (String uidsList ) => uidsList.split('_').toList();
}