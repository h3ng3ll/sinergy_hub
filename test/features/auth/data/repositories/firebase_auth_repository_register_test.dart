import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/crypto_service.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import 'package:sinergy_hub/core/services/google_sign_in_service/google_sign_in_service.dart';
import 'package:sinergy_hub/core/services/logger_service.dart';
import 'package:sinergy_hub/core/utils/env/env.dart';
import 'package:sinergy_hub/features/auth/data/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/failures/user_exists_with_such_email_failure.dart';

class _FirebaseAuthMock extends Mock implements FirebaseAuth {}

class _UserCredentialMock extends Mock implements UserCredential {}

class _UserMock extends Mock implements User {}

class _GoogleSignInMock extends Mock implements GoogleSignIn {}

class _GoogleSignInServiceMock extends Mock implements GoogleSignInService {}

class _EnvMock extends Mock implements Env {}

class _FirebaseFunctionsService extends Mock implements FirebaseFunctionsService {}

class _CryptoServiceMock extends Mock implements CryptoService {}
class _LoggerServiceMock extends Mock implements LoggerService {}

void main() {
  late _FirebaseAuthMock auth;
  late _UserCredentialMock credential;
  late _UserMock user;
  late FirebaseAuthRepository repository;
  late _LoggerServiceMock loggerService ;

  const email = 'new.user@example.com';
  const password = 'secret123';

  setUp(() {
    auth = _FirebaseAuthMock();
    credential = _UserCredentialMock();
    user = _UserMock();
    loggerService = _LoggerServiceMock();

    repository = FirebaseAuthRepository(
      auth: auth,
      googleSignIn: _GoogleSignInMock(),
      googleSignInService: _GoogleSignInServiceMock(),
      env: _EnvMock(),
      cryptoService: _CryptoServiceMock(),
      firebaseFunctionsService: _FirebaseFunctionsService(),
      loggerService: loggerService,
    );
  });

  group('FirebaseAuthRepository.register', () {
    test(
      'on success: creates the user AND sends the verification email, '
      'returns Left(null)',
      () async {
        when(
          () => auth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => credential);
        when(() => credential.user).thenReturn(user);
        when(() => user.sendEmailVerification()).thenAnswer((_) async {});

        final res = await repository.register(
          email: email,
          password: password,
        );

        expect(res.isLeft(), isTrue);
        // The fix: the verification email is sent on the freshly created
        // user, so registration never leaves the user without an email.
        verify(
          () => auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verify(() => user.sendEmailVerification()).called(1);
      },
    );

    test(
      'email-already-in-use → returns UserExistsWithSuchEmailFailure, '
      'never sends verification',
      () async {
        when(
          () => auth.createUserWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(
          FirebaseAuthException(code: 'email-already-in-use'),
        );

        final res = await repository.register(
          email: email,
          password: password,
        );

        expect(res.isRight(), isTrue);
        res.fold(
          (_) => fail('expected Right(failure)'),
          (e) => expect(e, isA<UserExistsWithSuchEmailFailure>()),
        );
        verify(
          () => auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).called(1);
        verifyNever(() => user.sendEmailVerification());
      },
    );
  });
}
