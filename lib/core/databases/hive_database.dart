import 'package:hive_ce_flutter/hive_flutter.dart';

/// Thin access point to Hive boxes for local repositories.
///
/// Hive is initialized (and adapters registered) once in `initHive()`.
/// Boxes are opened per call — Hive de-duplicates opens, so no app-level
/// box cache is kept here.
class HiveDatabase {
  Future<Box<E>> getBox<E>(String name) => Hive.openBox<E>(name);
}
