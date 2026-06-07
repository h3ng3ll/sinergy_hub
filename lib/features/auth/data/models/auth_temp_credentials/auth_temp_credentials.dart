import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../../domain/models/i_auth_credentials/i_auth_credentials.dart';

part 'auth_temp_credentials.g.dart';

part 'auth_temp_credentials.freezed.dart';

/// Temporary, Hive-cached credentials captured during open authorization
/// (Apple today, other providers later).
///
/// A provider returns the user's name/email only on the FIRST authorization,
/// so we cache them here and read them back when prefilling the "Tell about
/// yourself" onboarding page. This is a cache only — overwritten on every
/// sign-in, never a source of truth.
@freezed
sealed class AuthTempCredentials extends HiveObject
    with _$AuthTempCredentials
    implements IAuthCredentials {
  AuthTempCredentials._();

  factory AuthTempCredentials({
    String? firstName,
    String? lastName,
    String? email,
  }) = _AuthTempCredentials;

  factory AuthTempCredentials.fromJson(
    Map<String, dynamic> json,
  ) => _$AuthTempCredentialsFromJson(json);

  /// Whether any field is populated (see [IAuthCredentials.hasAny]).
  @override
  bool get hasAny =>
      (firstName?.isNotEmpty ?? false) ||
      (lastName?.isNotEmpty ?? false) ||
      (email?.isNotEmpty ?? false);
}
