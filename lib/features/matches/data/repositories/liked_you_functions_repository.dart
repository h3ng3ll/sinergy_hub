import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../../../core/services/logger_service.dart';
import '../../domain/exception/liked_you_failures.dart';
import '../../domain/models/liked_you_pg_state/liked_you_pg_state.dart';
import '../../domain/repositories/i_liked_you_repository.dart';
import '../models/liked_you_page_dto/liked_you_page_dto.dart';

class LikedYouFunctionsRepository implements ILikedYouRepository {
  final LoggerService _loggerService;
  final FirebaseFunctionsService _firebaseFunctionsService;

  LikedYouFunctionsRepository({
    required this._firebaseFunctionsService,
    required this._loggerService,
  });

  static const String _functionName = 'getLikedYou';

  @override
  Future<Either<LikedYouPgState, Exceptions>> get({
    required LikedYouPgState state,
  }) async {
    try {
      final dynamic rawResult = await _firebaseFunctionsService.call(
        functionName: _functionName,
        data: {
          'limit': state.pageSize,
          'cursor': state.cursor,
        },
      );

      if (rawResult is! Map) {
        return Right(LoadLikedYouFailure());
      }
      final page = LikedYouPageDto.fromJson(
        Map<String, dynamic>.from(rawResult),
      );
      return Left(page.toPgState(state));
    } on FunctionUnauthenticatedException catch (e) {
      return Right(LikedYouUnauthenticatedFailure(e.message));
    } on FunctionInvalidArgumentException catch (e) {
      return Right(LikedYouInvalidCursorFailure(e.message));
    } on FunctionUnavailableException catch (e) {
      return Right(LikedYouNetworkFailure(e.message));
    } on FunctionDeadlineExceededException catch (e) {
      return Right(LikedYouNetworkFailure(e.message));
    } on FunctionResourceExhaustedException catch (e) {
      return Right(LikedYouNetworkFailure(e.message));
    } on FirebaseFunctionException catch (e) {
      // Covers `not-found` (the callable isn't deployed yet), `internal`,
      // and every other typed exception this service can throw.
      _loggerService.error(
        'Failed to get liked you users',
        error: e,
      );
      return Right(LoadLikedYouFailure(e.message));
    } catch (e) {
      return Right(LoadLikedYouFailure(e.toString()));
    }
  }
}
