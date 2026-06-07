import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/data/models/auth_temp_credentials/auth_temp_credentials.dart';
import 'package:sinergy_hub/features/auth/domain/models/i_auth_credentials/i_auth_credentials.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_temp_credentials_repository.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_cached_auth_credentials_use_case.dart';

class _MockAuthTempCredentialsRepository extends Mock
    implements IAuthTempCredentialsRepository {}

void main() {
  late _MockAuthTempCredentialsRepository repository;
  late GetCachedAuthCredentialsUseCase useCase;

  setUp(() {
    repository = _MockAuthTempCredentialsRepository();
    useCase = GetCachedAuthCredentialsUseCase(
      authTempCredentialsRepository: repository,
    );
  });

  group('GetCachedAuthCredentialsUseCase', () {
    test('returns the cached credentials when present', () {
      final IAuthCredentials cached = AuthTempCredentials(
        firstName: 'Alex',
        lastName: 'Naumenko',
        email: 'alex@example.com',
      );
      when(() => repository.get()).thenReturn(cached);

      final result = useCase();

      expect(result, cached);
      verify(() => repository.get()).called(1);
    });

    test('returns null when the cache is empty', () {
      when(() => repository.get()).thenReturn(null);

      final result = useCase();

      expect(result, isNull);
    });
  });
}
