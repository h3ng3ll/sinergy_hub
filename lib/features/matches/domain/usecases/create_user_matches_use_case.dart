import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../exception/failed_matches_exception.dart';

class CreateUserMatchesUseCase {
  final FirebaseFunctionsService _firebaseFunctionsService;

  CreateUserMatchesUseCase({
    required FirebaseFunctionsService firebaseFunctionsService,
  }) : _firebaseFunctionsService = firebaseFunctionsService;

  /// return Status of Matching
  Future<Either<void, Exceptions>> call({
    required TinderCardStatus status,
    required String matchedID,
  }) async {
    try {
      await _firebaseFunctionsService.call(
        functionName: 'matchUser',
        data: {
          'matchId': matchedID,
          'status': status.name,
        },
      );
      return Left(null);
    } catch (e) {
      return Right(
        NoFoundParticipantsInMatchesException(),
      );
    }
  }
}
