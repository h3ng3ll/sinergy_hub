import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/failures/failure.dart';
import 'package:sinergy_hub/core/failures/uknown_failure.dart';
import 'package:sinergy_hub/features/home/presentation/tabs/profile_tab/bloc/profile_bloc/profile_bloc.dart';
import 'package:sinergy_hub/features/subscription/domain/usecases/get_subscription_management_url_use_case.dart';
import 'package:sinergy_hub/features/user/domain/usecases/delete_account_use_case.dart';

class _MockDeleteAccountUseCase extends Mock implements DeleteAccountUseCase {}

class _MockGetSubscriptionManagementUrlUseCase extends Mock
    implements GetSubscriptionManagementUrlUseCase {}

void main() {
  late _MockDeleteAccountUseCase deleteAccountUseCase;
  late _MockGetSubscriptionManagementUrlUseCase
  getSubscriptionManagementUrlUseCase;

  setUp(() {
    deleteAccountUseCase = _MockDeleteAccountUseCase();
    getSubscriptionManagementUrlUseCase =
        _MockGetSubscriptionManagementUrlUseCase();
  });

  ProfileBloc buildBloc() => ProfileBloc(
    deleteAccountUseCase: deleteAccountUseCase,
    getSubscriptionManagementUrlUseCase: getSubscriptionManagementUrlUseCase,
  );

  group('ProfileBloc.deleteAccount', () {
    blocTest<ProfileBloc, ProfileState>(
      'emits [deleting, deleted] when use case succeeds',
      build: buildBloc,
      setUp: () {
        when(
          () => deleteAccountUseCase(),
        ).thenAnswer((_) async => const Right<Failure, void>(null));
      },
      act: (bloc) => bloc.add(const ProfileEvent.deleteAccount()),
      expect: () => [
        isA<ProfileState>().having(
          (s) => s.status,
          'status',
          EProfileStatus.deleting,
        ),
        isA<ProfileState>().having(
          (s) => s.status,
          'status',
          EProfileStatus.deleted,
        ),
      ],
      verify: (_) {
        verify(() => deleteAccountUseCase()).called(1);
      },
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits [deleting, deleteFailed] with the failure message on Left',
      build: buildBloc,
      setUp: () {
        when(
          () => deleteAccountUseCase(),
        ).thenAnswer((_) async => Left<Failure, void>(UnknownFailure()));
      },
      act: (bloc) => bloc.add(const ProfileEvent.deleteAccount()),
      expect: () => [
        isA<ProfileState>().having(
          (s) => s.status,
          'status',
          EProfileStatus.deleting,
        ),
        isA<ProfileState>()
            .having((s) => s.status, 'status', EProfileStatus.deleteFailed)
            .having(
              (s) => s.errorMessage,
              'errorMessage',
              'Something went wrong',
            ),
      ],
      verify: (_) {
        verify(() => deleteAccountUseCase()).called(1);
      },
    );
  });
  group('ProfileBloc.deleteAccount does not touch subscription', () {
    blocTest<ProfileBloc, ProfileState>(
      'never resolves the subscription management url',
      build: buildBloc,
      setUp: () {
        when(
          () => deleteAccountUseCase(),
        ).thenAnswer((_) async => const Right<Failure, void>(null));
      },
      act: (bloc) => bloc.add(const ProfileEvent.deleteAccount()),
      verify: (_) {
        verifyNever(() => getSubscriptionManagementUrlUseCase());
      },
    );
  });
}
