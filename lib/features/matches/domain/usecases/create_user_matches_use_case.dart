import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../exception/daily_match_limit_exceeded_exception.dart';
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
      final result = await _firebaseFunctionsService.call(
        functionName: 'matchUser',
        data: {
          'matchId': matchedID,
          'status': status.name,
        },
      );

      /// The daily limit is returned as a normal value, not thrown.
      /// Nothing is written server-side, so the like is not sent.
      if (result is Map &&
          result['success'] == false &&
          result['status'] == 'failed') {
        return Right(
          DailyMatchLimitExceededException(),
        );
      }
      return Left(null);
    } catch (e) {
      return Right(
        NoFoundParticipantsInMatchesException(),
      );
    }
  }
}
