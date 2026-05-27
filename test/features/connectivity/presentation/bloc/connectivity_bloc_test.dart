import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/connectivity_service.dart';
import 'package:sinergy_hub/features/connectivity/presentation/bloc/connectivity_bloc/connectivity_bloc.dart';

class _ConnectivityServiceMock extends Mock implements ConnectivityService {}

void main() {
  late _ConnectivityServiceMock service;
  late StreamController<bool> controller;

  setUp(() {
    service = _ConnectivityServiceMock();
    controller = StreamController<bool>.broadcast();
    when(() => service.stream).thenAnswer((_) => controller.stream);
    when(() => service.isInitialised).thenReturn(false);
    when(() => service.isOnline).thenReturn(true);
  });

  tearDown(() async {
    await controller.close();
  });

  group('ConnectivityBloc initial state', () {
    test('reflects service.isOnline=true when initialised (pre-runApp seed)',
        () {
      when(() => service.isInitialised).thenReturn(true);
      when(() => service.isOnline).thenReturn(true);

      final bloc = ConnectivityBloc(connectivityService: service);

      expect(bloc.state.status, ConnectivityStatus.online);
      bloc.close();
    });

    test('reflects service.isOnline=false when initialised offline', () {
      when(() => service.isInitialised).thenReturn(true);
      when(() => service.isOnline).thenReturn(false);

      final bloc = ConnectivityBloc(connectivityService: service);

      expect(bloc.state.status, ConnectivityStatus.offline);
      bloc.close();
    });

    test('stays at initial when service has not been initialised', () {
      when(() => service.isInitialised).thenReturn(false);

      final bloc = ConnectivityBloc(connectivityService: service);

      expect(bloc.state.status, ConnectivityStatus.initial);
      bloc.close();
    });
  });

  group('ConnectivityBloc', () {
    test('emits online when service stream emits true', () async {
      final bloc = ConnectivityBloc(connectivityService: service);
      final states = <ConnectivityState>[];
      final sub = bloc.stream.listen(states.add);

      controller.add(true);
      await Future<void>.delayed(Duration.zero);

      expect(states, [
        const ConnectivityState(status: ConnectivityStatus.online),
      ]);

      await sub.cancel();
      await bloc.close();
    });

    test('emits offline when service stream emits false', () async {
      final bloc = ConnectivityBloc(connectivityService: service);
      final states = <ConnectivityState>[];
      final sub = bloc.stream.listen(states.add);

      controller.add(false);
      await Future<void>.delayed(Duration.zero);

      expect(states, [
        const ConnectivityState(status: ConnectivityStatus.offline),
      ]);

      await sub.cancel();
      await bloc.close();
    });

    test('close() cancels the service subscription', () async {
      final bloc = ConnectivityBloc(connectivityService: service);
      await bloc.close();

      // Emitting after close should not throw or affect anything.
      expect(() => controller.add(true), returnsNormally);
    });
  });

  group('ConnectivityStateX', () {
    test('isResolved is false for initial, true otherwise', () {
      expect(const ConnectivityState().isResolved, isFalse);
      expect(
        const ConnectivityState(status: ConnectivityStatus.online).isResolved,
        isTrue,
      );
      expect(
        const ConnectivityState(status: ConnectivityStatus.offline).isResolved,
        isTrue,
      );
    });

    test('isOnline / isOffline reflect status', () {
      expect(
        const ConnectivityState(status: ConnectivityStatus.online).isOnline,
        isTrue,
      );
      expect(
        const ConnectivityState(status: ConnectivityStatus.offline).isOffline,
        isTrue,
      );
    });
  });
}
