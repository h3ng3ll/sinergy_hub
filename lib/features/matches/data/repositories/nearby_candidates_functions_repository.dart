import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../../user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import '../../domain/exception/nearby_candidates_failures.dart';
import '../../domain/models/matches_filter/matches_filter.dart';
import '../../domain/repositories/i_nearby_candidates_repository.dart';
import '../models/nearby_candidates_page_dto/nearby_candidates_page_dto.dart';

class NearbyCandidatesFunctionsRepository
    implements INearbyCandidatesRepository {
  final FirebaseFunctionsService _firebaseFunctionsService;

  NearbyCandidatesFunctionsRepository({
    required this._firebaseFunctionsService,
  });

  static const String _functionName = 'searchNearbyCandidates';

  @override
  Future<UserDataPgState> search({
    required UserDataPgState userDataState,
    required MatchesFilter filter,
  }) async {
    try {
      final dynamic rawResult = await _firebaseFunctionsService.call(
        functionName: _functionName,
        data: {
          'radiusKm': filter.radiusKm,
          'experience': filter.experience?.name,
          'specialization': filter.specialization?.name,
          'skills': filter.skills.map((e) => e.name).toList(),
          'cursor': userDataState.cursor,
          'limit': userDataState.pageSize,
        },
      );

      if (rawResult is! Map) {
        throw const NearbyCandidatesFailure();
      }

      final page = NearbyCandidatesPageDto.fromRaw(rawResult);
      return page.toPgState(userDataState);
    } on FunctionFailedPreconditionException catch (e) {
      throw NearbyCandidatesNoCoordinatesException(
        e.message ?? const NearbyCandidatesNoCoordinatesException().message,
      );
    } on FirebaseFunctionException catch (e) {
      throw NearbyCandidatesFailure(
        e.message ?? const NearbyCandidatesFailure().message,
      );
    }
  }
}
