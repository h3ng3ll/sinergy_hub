import '../../../auth/domain/repostories/i_auth_repository.dart';
import '../../../chat/domain/usecases/init_chat_use_case.dart';
import '../../presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import '../../../notifications/domain/models/notification/notification.dart';
import '../../../notifications/domain/repositories/i_notification_repository.dart';
import '../models/user_match/user_match.dart';
import '../repositories/i_user_matching_in_repository.dart';
import '../repositories/i_user_matching_out_repository.dart';

class CreateUserMatchesUseCase {
  final IUserMatchingOutRepository _userMatchingOutRepository;
  final IUserMatchingInRepository _userMatchingInRepository;
  final INotificationRepository _notificationRepository;
  final IAuthRepository _authRepository;

  final InitChatUseCase _initChatUseCase;

  CreateUserMatchesUseCase({
    required IUserMatchingOutRepository userMatchingOutRepository,
    required IUserMatchingInRepository userMatchingInRepository,
    required INotificationRepository notificationRepository,
    required InitChatUseCase initChatUseCase,
    required IAuthRepository authRepository,
  }) : _userMatchingOutRepository = userMatchingOutRepository,
       _userMatchingInRepository = userMatchingInRepository,
       _initChatUseCase = initChatUseCase,
       _notificationRepository = notificationRepository,
       _authRepository = authRepository;

  /// return Status of Matching
  Future<EUserMatchCompleteness> call({
    required UserMatch match,
  }) async {

    final uid = await _authRepository.requireUserId();

    if (match.matchStatus != TinderCardStatus.liked) {
      /// create match record in actor
      await _userMatchingOutRepository.create(
        uid: uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.none,
        ),
      );
      return EUserMatchCompleteness.none;
    }

    /// Initialize chat for matched users
    await _initChatUseCase.call(
      participants: [
        uid,
        match.user.uid,
      ],
    );

    /// who   matched create record
    /// process cases

    final possibleMatch = await _userMatchingInRepository.getById(
      uid: uid,
    );

    /// other user not match current one
    if (possibleMatch == null) {
      await _userMatchingOutRepository.create(
        uid: uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.oneWayMatch,
        ),
      );
      await _userMatchingInRepository.create(
        uid: match.user.uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.none,
        ),
      );

      /// Save notification for other user
      await _notificationRepository.create(
        uid: uid,
        notification: Notification(
          uid: match.user.uid,
          title: 'New Interest 🚀',
          description: 'A potential co-founder liked your profile',
          createdAt: DateTime.now(),
        ),
      );
      return EUserMatchCompleteness.oneWayMatch;
    }

    ///  has matching from both size
    if (possibleMatch.completeness == EUserMatchCompleteness.oneWayMatch) {
      await _userMatchingOutRepository.create(
        uid: uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.twoWayMatch,
        ),
      );
      await _userMatchingInRepository.create(
        uid: match.user.uid,
        match: match.copyWith(
          completeness: EUserMatchCompleteness.twoWayMatch,
        ),
      );
      final now = DateTime.now();

      /// Notify current user
      await _notificationRepository.create(
        uid: uid,
        notification: Notification(
          uid: uid,
          title: 'It’s a Match! 🎉',
          description: 'You’ve connected with a startup partner',
          createdAt: now,
        ),
      );

      /// Notify other user
      await _notificationRepository.create(
        uid: uid,
        notification: Notification(
          uid: match.user.uid,
          title: 'It’s a Match! 🎉',
          description: 'You’ve connected with a startup partner',
          createdAt: now,
        ),
      );
      return EUserMatchCompleteness.twoWayMatch;
    }

    throw Exception(
      'Unhandled matching result',
    );
  }
}
