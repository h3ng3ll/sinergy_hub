// Mock global blocs for screenshot tests. These subclass the real bloc
// types so they fit anywhere the production code reads them by type.
// Each mock emits a hardcoded "loaded" state that matches the showcase.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/features/auth/domain/repostories/i_auth_repository.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/apple_sign_in_use_case.dart';
import 'package:sinergy_hub/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:sinergy_hub/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:sinergy_hub/features/chat/domain/usecases/listen_chats_use_case.dart';
import 'package:sinergy_hub/features/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:sinergy_hub/features/notifications/presentation/bloc/notification_config_bloc/notification_config_bloc.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/use_cases/get_skills_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/listen_user_data_use_case.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/skills_bloc/skills_bloc.dart';
import 'package:sinergy_hub/features/user/presentation/bloc/user_bloc/user_bloc.dart';

import 'showcase_data.dart';

/// A fake firebase_auth User. We use mocktail so we don't have to
/// implement the dozens of abstract methods on User.
class FakeFirebaseUser extends Mock implements User {
  @override
  String get uid => ShowcaseData.heroUid;

  @override
  String? get email => 'alex.reed@example.com';

  @override
  bool get emailVerified => true;

  @override
  String? get displayName => 'Alex Reed';

  @override
  String? get photoURL => null;
}

/// MockAuthBloc: subclasses the real AuthBloc and emits an authorized
/// state immediately. We pass dummy dependencies because the parent
/// constructor needs them, but no events that would call them are
/// dispatched in the screenshot flow.
class MockAuthBloc extends AuthBloc {
  MockAuthBloc({
    required super.authRepository,
    required super.signInWithGoogleUseCase,
    required super.appleSignInUseCase,
    required super.logoutUseCase,
  }) {
    // Push the authorized state right away so the router redirect
    // picks it up immediately.
    emit(
      AuthState(
        status: AuthStatus.authorized,
        user: FakeFirebaseUser(),
        isEmailVerified: true,
      ),
    );
  }

  /// Public entry to flip the state for the auth-page screenshots.
  void setLogout() {
    emit(const AuthState(status: AuthStatus.logout));
  }

  void setAuthorized() {
    emit(
      AuthState(
        status: AuthStatus.authorized,
        user: FakeFirebaseUser(),
        isEmailVerified: true,
      ),
    );
  }
}

/// MockUserBloc: subclasses the real UserBloc and emits a loaded state
/// with the hero user data populated. Provides a setter to flip to
/// noData for the onboarding screenshots.
class MockUserBloc extends UserBloc {
  MockUserBloc({required super.listenUserDataUseCase}) {
    emit(
      UserState(userData: ShowcaseData.hero(), status: UserStatus.loaded),
    );
  }

  void setLoaded() {
    emit(
      UserState(userData: ShowcaseData.hero(), status: UserStatus.loaded),
    );
  }

  void setNoData() {
    // Keep userData populated even when status==noData so any chat /
    // matches widgets that are still mounted in a kept-alive shell
    // branch (IndexedStack) don't crash on `state.userData!`. The
    // router redirect only checks `status`, so route guarding still
    // works as expected.
    emit(
      UserState(userData: ShowcaseData.hero(), status: UserStatus.noData),
    );
  }
}

/// MockSkillsBloc: emits a populated skills list immediately.
class MockSkillsBloc extends SkillsBloc {
  MockSkillsBloc({required super.getSkillsUseCase}) {
    emit(SkillsState(status: SkillsStatus.loaded, skills: ShowcaseData.skills()));
  }
}

/// MockChatBloc: emits a populated chat list immediately.
class MockChatBloc extends ChatBloc {
  MockChatBloc({required super.getChatsUseCase}) {
    emit(ChatState(status: ChatStatus.initial, chats: ShowcaseData.chats()));
  }
}

/// MockNotificationConfigBloc: emits an idle initial state — the real
/// bloc's _init dispatches an FCM-touching call we don't want to run.
class MockNotificationConfigBloc extends NotificationConfigBloc {
  MockNotificationConfigBloc({
    required super.getNotificationsConfigUseCase,
    required super.saveNotificationsConfigUseCase,
    required super.registerCurrentDeviceTokenUseCase,
    required super.firebaseMessagingService,
  }) {
    emit(const NotificationConfigState(status: NotificationConfigStatus.initial));
  }
}

/// Dummy mocktail mocks for the use-case dependencies of the mock
/// blocs above. They never get invoked because the mock blocs
/// override the bloc's state directly.
class FakeAppleSignInUseCase extends Mock implements AppleSignInUseCase {}

class FakeSignInWithGoogleUseCase extends Mock
    implements SignInWithGoogleUseCase {}

class FakeListenUserDataUseCase extends Mock implements ListenUserDataUseCase {}

class FakeGetSkillsUseCase extends Mock implements GetSkillsUseCase {}

class FakeListenChatsUseCase extends Mock implements ListenChatsUseCase {}

class FakeAuthRepository extends Mock implements IAuthRepository {}
