import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/connectivity_service.dart';

class _ConnectivityMock extends Mock implements Connectivity {}

void main() {
  late _ConnectivityMock connectivity;
  late StreamController<List<ConnectivityResult>> controller;

  setUp(() {
    connectivity = _ConnectivityMock();
    controller = StreamController<List<ConnectivityResult>>.broadcast();
    when(() => connectivity.onConnectivityChanged)
        .thenAnswer((_) => controller.stream);
  });

  tearDown(() async {
    if (controller.hasListener || !controller.isClosed) {
      await controller.close();
    }
  });

  group('ConnectivityService.init', () {
    test('seeds isOnline=true from checkConnectivity and subscribes',
        () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      final service = ConnectivityService(connectivity: connectivity);

      await service.init();

      expect(service.isInitialised, isTrue);
      expect(service.isOnline, isTrue);
      verify(() => connectivity.checkConnectivity()).called(1);
      verify(() => connectivity.onConnectivityChanged).called(1);

      await service.dispose();
    });

    test('seeds isOnline=false when offline at startup', () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.none]);
      final service = ConnectivityService(connectivity: connectivity);

      await service.init();

      expect(service.isOnline, isFalse);
      await service.dispose();
    });

    test('init() does NOT emit on the stream (seed only)', () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      final service = ConnectivityService(connectivity: connectivity);

      final emitted = <bool>[];
      final sub = service.stream.listen(emitted.add);

      await service.init();
      await Future<void>.delayed(Duration.zero);

      expect(emitted, isEmpty);
      await sub.cancel();
      await service.dispose();
    });

    test('init() is idempotent — second call is a no-op', () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      final service = ConnectivityService(connectivity: connectivity);

      await service.init();
      await service.init();

      verify(() => connectivity.checkConnectivity()).called(1);
      verify(() => connectivity.onConnectivityChanged).called(1);

      await service.dispose();
    });
  });

  group('ConnectivityService — connectivity stream', () {
    test('emits false when OS reports only ConnectivityResult.none', () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      final service = ConnectivityService(connectivity: connectivity);

      final emitted = <bool>[];
      final sub = service.stream.listen(emitted.add);

      await service.init();
      controller.add([ConnectivityResult.none]);
      await Future<void>.delayed(Duration.zero);

      expect(emitted, [false]);
      expect(service.isOnline, isFalse);

      await sub.cancel();
      await service.dispose();
    });

    test('emits true when OS reports wifi/mobile after being offline',
        () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.none]);
      final service = ConnectivityService(connectivity: connectivity);

      final emitted = <bool>[];
      final sub = service.stream.listen(emitted.add);

      await service.init();
      controller.add([ConnectivityResult.wifi]);
      await Future<void>.delayed(Duration.zero);

      expect(emitted, [true]);
      expect(service.isOnline, isTrue);

      await sub.cancel();
      await service.dispose();
    });

    test('deduplicates: same status twice in a row emits once', () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      final service = ConnectivityService(connectivity: connectivity);

      final emitted = <bool>[];
      final sub = service.stream.listen(emitted.add);

      await service.init();
      controller.add([ConnectivityResult.none]);
      controller.add([ConnectivityResult.none]);
      await Future<void>.delayed(Duration.zero);

      expect(emitted, [false]);

      await sub.cancel();
      await service.dispose();
    });
  });

  group('ConnectivityService.dispose', () {
    test('cancels subscription and closes the stream', () async {
      when(() => connectivity.checkConnectivity())
          .thenAnswer((_) async => [ConnectivityResult.wifi]);
      final service = ConnectivityService(connectivity: connectivity);
      await service.init();

      await service.dispose();

      // Emitting after dispose should not throw (subscription was cancelled).
      expect(() => controller.add([ConnectivityResult.none]), returnsNormally);
    });
  });
}
