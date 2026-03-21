import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

class CreateUserMatchesUseCase {
  final FirebaseFunctionsService _firebaseFunctionsService;

  CreateUserMatchesUseCase({
    required FirebaseFunctionsService firebaseFunctionsService,
  }) : _firebaseFunctionsService = firebaseFunctionsService;

  /// return Status of Matching
  Future<void> call({
    required TinderCardStatus status,
    required String matchedID,
  }) async {
    await _firebaseFunctionsService.call(
      functionName: 'matchUser',
      data: {
        'matchId': matchedID,
        'status': status.name,
      },
    );
  }
}
