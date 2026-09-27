import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../models/liked_you_pg_state/liked_you_pg_state.dart';

abstract class ILikedYouRepository {
  /// Left = success (mirrors `ISubscriptionRepository`'s reversed polarity).
  Future<Either<LikedYouPgState, Exceptions>> get({
    required LikedYouPgState state,
  });
}
