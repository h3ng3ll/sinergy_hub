import 'package:dartz/dartz.dart';

import '../../../../core/models/exceptions.dart';
import '../models/liked_you_pg_state/liked_you_pg_state.dart';
import '../repositories/i_liked_you_repository.dart';

class GetLikedYouUseCase {
  final ILikedYouRepository _likedYouRepository;

  GetLikedYouUseCase({
    required this._likedYouRepository,
  });

  Future<Either<LikedYouPgState, Exceptions>> call({
    required LikedYouPgState state,
  }) => _likedYouRepository.get(
    state: state,
  );
}
