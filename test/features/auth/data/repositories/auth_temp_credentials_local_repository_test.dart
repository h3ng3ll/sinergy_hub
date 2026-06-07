import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:sinergy_hub/core/hive/hive_registrar.g.dart';
import 'package:sinergy_hub/features/auth/data/models/auth_temp_credentials/auth_temp_credentials.dart';
import 'package:sinergy_hub/features/auth/data/repositories/auth_temp_credentials_local_repository.dart';

void main() {
  late Directory tempDir;
  late Box<AuthTempCredentials> box;
  late AuthTempCredentialsLocalRepository repository;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('auth_temp_creds_test');
    Hive.init(tempDir.path);
    Hive.registerAdapters();
  });

  setUp(() async {
    box = await Hive.openBox<AuthTempCredentials>('auth_temp_credentials_test');
    await box.clear();
    repository = AuthTempCredentialsLocalRepository(box: box);
  });

  tearDown(() async {
    await box.close();
  });

  tearDownAll(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  group('AuthTempCredentialsLocalRepository', () {
    test('save then get round-trips the credentials', () async {
      final creds = AuthTempCredentials(
        firstName: 'Alex',
        lastName: 'Naumenko',
        email: 'alex@example.com',
      );

      await repository.save(creds);

      expect(repository.get(), creds);
    });

    test('a second save overwrites the single cached record', () async {
      await repository.save(
        AuthTempCredentials(firstName: 'Old', lastName: 'Name'),
      );
      await repository.save(
        AuthTempCredentials(firstName: 'New', lastName: 'Name'),
      );

      expect(repository.get()?.firstName, 'New');
      // Single record only — never accumulates.
      expect(box.length, 1);
    });

    test('clear empties the cache', () async {
      await repository.save(
        AuthTempCredentials(firstName: 'Alex'),
      );

      await repository.clear();

      expect(repository.get(), isNull);
    });

    test('get returns null when nothing was cached', () {
      expect(repository.get(), isNull);
    });
  });
}
