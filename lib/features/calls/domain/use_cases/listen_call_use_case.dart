import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../repositories/i_calls_repository.dart';
import '../models/call/call.dart';

class ListenCallUseCase {
  final ICallsRepository callsRepository;
  final IAuthRepository authRepository;

  ListenCallUseCase({
    required this.callsRepository,
    required this.authRepository,
  });

  Stream<Call> execute() async* {
    final uid = await authRepository.requireUserId();
    yield* callsRepository.listenCall(
      uid,
    );
  }
}
