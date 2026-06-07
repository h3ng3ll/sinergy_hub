import 'package:hive_ce/hive.dart';

import '../../domain/models/i_auth_credentials/i_auth_credentials.dart';
import '../../domain/repostories/i_auth_temp_credentials_repository.dart';
import '../models/auth_temp_credentials/auth_temp_credentials.dart';

/// Hive-backed implementation of [IAuthTempCredentialsRepository].
///
/// Stores a single record under [_key], overwritten on every sign-in. The
/// opened box is injected (via DI) so the repository keeps no Hive
/// setup/teardown responsibilities.
class AuthTempCredentialsLocalRepository
    implements IAuthTempCredentialsRepository {
  AuthTempCredentialsLocalRepository({
    required Box<AuthTempCredentials> box,
  }) : _box = box;

  final Box<AuthTempCredentials> _box;

  static const String _key = 'current';

  @override
  Future<void> save(
    IAuthCredentials credentials,
  ) =>
      _box.put(
        _key,
        AuthTempCredentials(
          firstName: credentials.firstName,
          lastName: credentials.lastName,
          email: credentials.email,
        ),
      );

  @override
  IAuthCredentials? get() => _box.get(
        _key,
      );

  @override
  Future<void> clear() => _box.delete(
        _key,
      );
}
