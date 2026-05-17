// Mock repository implementations for screenshot tests.
// These do not extend mocktail mocks — they're plain implementations of
// the same interfaces that return showcase data and never touch Firebase.

import 'dart:async';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:sinergy_hub/core/models/exceptions.dart';
import 'package:sinergy_hub/core/models/failures.dart';
import 'package:sinergy_hub/features/auth/domain/failures/auth_failures.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_message/chat_message.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_pg_state.dart/chat_pg_state.dart';
import 'package:sinergy_hub/features/chat/domain/models/e_chat_filter.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_message_repository.dart';
import 'package:sinergy_hub/features/chat/domain/repositories/i_chat_repository.dart';
import 'package:sinergy_hub/features/chat/domain/services/i_presence_service.dart';
import 'package:sinergy_hub/features/matches/data/models/matches_dto/matches_dto.dart';
import 'package:sinergy_hub/features/matches/domain/models/matches_filter/matches_filter.dart';
import 'package:sinergy_hub/features/matches/domain/repositories/i_matches_repository.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification/notification.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification_config/notification_config.dart';
import 'package:sinergy_hub/features/notifications/domain/repositories/i_notification_config_repository.dart';
import 'package:sinergy_hub/features/notifications/domain/repositories/i_notification_repository.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/onboard_status/onboard_status.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/user_profiler/user_profiler.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/repositories/i_onboard_survey_repository.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/repositories/i_skill_repository.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/features/user/domain/models/users_data_pg_state/users_data_pg_state.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_auth_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_read_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_storage_repository.dart';
import 'package:sinergy_hub/features/user/domain/repositories/i_user_write_repository.dart';
import 'package:sinergy_hub/features/user/domain/services/i_app_mode_service.dart';
import 'package:sinergy_hub/features/user_chat/domain/repositories/i_user_chat_repository.dart';

import 'showcase_data.dart';

class MockAuthRepository implements IAuthRepository {
  @override
  Future<bool> isAuthorized() async => true;

  @override
  Future<String> requireUserId() async => ShowcaseData.heroUid;

  @override
  Future<User?> getCurrentUser() async => null;

  @override
  Stream<User?> watchUser() => const Stream<User?>.empty();

  @override
  Future<UserCredential> signInAnonymously() =>
      throw UnimplementedError('signInAnonymously');

  @override
  Future<Either<void, Exceptions>> signInWithGoogle() async => left(null);

  @override
  Future<Either<UserCredential?, Failure>> signInWithApple() async =>
      left(null);

  @override
  Future<void> signOut() async {}

  @override
  Future<void> deleteAccount() async {}

  @override
  Future<Either<void, AuthFailure>> register({
    required String email,
    required String password,
  }) async => left(null);

  @override
  Future<Either<void, AuthFailure>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async => left(null);

  @override
  Future<Either<void, AuthFailure>> sendEmailVerification() async => left(null);

  @override
  Future<Either<void, AuthFailure>> reload() async => left(null);

  @override
  Future<Either<void, AuthFailure>> sendPasswordResetEmail({
    required String email,
  }) async => left(null);
}

class MockUserReadRepository implements IUserReadRepository {
  @override
  Future<UserData?> getUserById({required String id}) async {
    if (id == ShowcaseData.heroUid) return ShowcaseData.hero();
    if (id == ShowcaseData.partnerUid) return ShowcaseData.partner();
    return ShowcaseData.discoveryCandidates().where((u) => u.uid == id).firstOrNull;
  }

  @override
  Future<List<UserData>> getUsersById({required List<String> ids}) async {
    final all = [
      ShowcaseData.hero(),
      ShowcaseData.partner(),
      ...ShowcaseData.discoveryCandidates(),
    ];
    return all.where((u) => ids.contains(u.uid)).toList();
  }

  @override
  Stream<UserData?> userDataStream(String uid) async* {
    if (uid == ShowcaseData.heroUid) {
      yield ShowcaseData.hero();
    } else if (uid == ShowcaseData.partnerUid) {
      yield ShowcaseData.partner();
    } else {
      final found = ShowcaseData.discoveryCandidates()
          .where((u) => u.uid == uid)
          .firstOrNull;
      yield found;
    }
  }

  @override
  Future<UserDataPgState> get({
    required UserDataPgState userDataState,
    MatchesFilter? filter,
  }) async {
    return UserDataPgState(
      items: ShowcaseData.discoveryCandidates(),
      hasMore: false,
      startIndex: ShowcaseData.discoveryCandidates().length,
      pageSize: 10,
    );
  }
}

class MockUserWriteRepository implements IUserWriteRepository {
  @override
  Future<void> update({required UserData userData}) async {}

  @override
  Future<void> setUserProfiler({
    required String uid,
    required UserProfiler userProfiler,
  }) async {}
}

class MockUserStorageRepository implements IUserStorageRepository {
  @override
  Future<String> updateAvatar({
    required String uid,
    required Uint8List avatar,
  }) async => '';

  @override
  Future<void> deleteAvatar({required String path}) async {}

  @override
  Future<String> getAvatarUrl(UserData user) async => '';
}

class MockUserAuthRepository implements IUserAuthRepository {
  @override
  Future<User?> currentUserFuture() async => null;

  @override
  Stream<User?> currentUserStream() => const Stream<User?>.empty();
}

class MockChatRepository implements IChatRepository {
  @override
  Future<Chat> create(Chat chat, String uid) async => chat;

  @override
  Stream<List<Chat>> getStream(String uid) => Stream.value(ShowcaseData.chats());

  @override
  Stream<Chat> listenByIdStream({
    required String uid,
    required String chatId,
  }) {
    final chat = ShowcaseData.chats().where((c) => c.chatId == chatId).firstOrNull;
    if (chat == null) return const Stream<Chat>.empty();
    return Stream.value(chat);
  }

  @override
  Stream<Chat> chatUpdates({required String uid}) =>
      const Stream<Chat>.empty();

  @override
  Future<Chat> getById({required String uid, required String chatId}) async {
    final chat = ShowcaseData.chats().where((c) => c.chatId == chatId).firstOrNull;
    if (chat != null) return chat;
    return ShowcaseData.chats().first;
  }

  @override
  Future<void> update({required Chat chat}) async {}

  @override
  Future<void> updateTypeInfo({
    required String uid,
    required String chatId,
    required bool isTyping,
  }) async {}

  @override
  Future<ChatPgState> get({
    required String uid,
    required ChatPgState chatState,
    String? query,
    EChatFilter filter = EChatFilter.all,
  }) async {
    final all = ShowcaseData.chats();
    final filtered = (query == null || query.isEmpty)
        ? all
        : all
              .where(
                (c) => (c.participantInfo[ShowcaseData.partnerUid]?.name ?? '')
                    .toLowerCase()
                    .contains(query.toLowerCase()),
              )
              .toList();
    return ChatPgState(
      chats: filtered,
      hasMore: false,
      startIndex: filtered.length,
      pageSize: 10,
    );
  }

  @override
  Future<Chat?> chatByParticipates({
    required String uid,
    required List<String> participates,
  }) async {
    return ShowcaseData.chats().firstOrNull;
  }

  @override
  Future<void> updateConfig({
    required String uid,
    required String chatId,
    required ChatConfig config,
  }) async {}

  @override
  Future<ChatConfig> getConfig({
    required String uid,
    required String chatId,
  }) async => const ChatConfig();
}

class MockChatMessageRepository implements IChatMessageRepository {
  @override
  Future<ChatMessage> create({
    required String chatId,
    required ChatMessage message,
  }) async => message;

  @override
  Stream<List<ChatMessage>> getLastMessagesStream({
    required String uid,
    required String chatId,
  }) => Stream.value(ShowcaseData.messages());
}

class MockMatchesRepository implements IMatchesRepository {
  @override
  Stream<MatchesDto?> listenTwoWayMatch({required String uid}) =>
      const Stream<MatchesDto?>.empty();

  @override
  Future<MatchesDto?> getById({required String uid}) async =>
      ShowcaseData.matchDto();

  @override
  Future<List<String>> getUids({required String uid}) async => const [];

  @override
  Future<void> markAsNotified({
    required String matchId,
    required String uid,
  }) async {}

  @override
  Future<List<String>> getUidsWhereIncludeUser({required String uid}) async =>
      const [];
}

class MockNotificationRepository implements INotificationRepository {
  @override
  Future<List<Notification>> get({required String uid}) async =>
      ShowcaseData.notifications();

  @override
  Stream<Notification> listen({required String uid}) =>
      const Stream<Notification>.empty();

  @override
  Future<Notification> create({
    required String uid,
    required Notification notification,
  }) async => notification;
}

class MockNotificationConfigRepository implements INotificationConfigRepository {
  @override
  Future<NotificationConfig?> get({required String uid}) async =>
      const NotificationConfig();

  @override
  Future<void> update({
    required String uid,
    required NotificationConfig config,
  }) async {}
}

class MockOnboardSurveyRepository implements IOnboardSurveyRepository {
  @override
  Future<void> updateUserProfileData({
    required UserProfiler userProfiler,
    required String uid,
  }) async {}

  @override
  Future<bool> isExistsProfilerData({required String uid}) async => true;

  @override
  Future<UserProfiler> getProfilerData({required String uid}) async =>
      ShowcaseData.hero().profiler;

  @override
  Future<void> setCompletionStatus({
    required OnboardStatus status,
    required String uid,
  }) async {}

  @override
  Future<OnboardStatus?> getCompletionStatus({required String uid}) async =>
      // Return all-false so OnboardShellPage's BlocListener does NOT
      // redirect to discovery when the test is on onboarding routes.
      const OnboardStatus();
}

class MockSkillRepository implements ISkillRepository {
  @override
  Future<List<String>> getSkills() async => ShowcaseData.skills();
}

class MockUserChatRepository implements IUserChatRepository {
  @override
  Future<void> create({required String uid, required String chatId}) async {}

  @override
  Future<List<String>> getChatIds({required String uid}) async => const [];
}

class MockAppModeService implements IAppModeService {
  @override
  Future<bool> isTutorialMatchMode() async => false;
}

class MockPresenceService implements IPresenceService {
  @override
  Future<void> init() async {}

  @override
  Future<void> onChangeState(AppLifecycleState state) async {}
}
