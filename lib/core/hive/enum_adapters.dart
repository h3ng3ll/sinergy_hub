import 'package:hive_ce/hive_ce.dart';

import '../../features/matches/domain/models/liked_you/liked_you_item.dart';
import '../../features/matches/domain/models/liked_you/liked_you_quota.dart';
import '../../features/onboard_survey/domain/models/experience/experience.dart';
import '../../features/onboard_survey/domain/models/specialization/specialization.dart';

/// Hand-written enum adapters. They use typeIds ≥ 100 so they never collide
/// with the 0–99 range `@GenerateAdapters` assigns to models.
///
/// Stored by index, so new values must be appended, never inserted. An index
/// that is out of range (a value removed in a later version) reads back as a
/// safe default instead of throwing.
class EImageStateAdapter extends TypeAdapter<EImageState> {
  @override
  final int typeId = 100;

  @override
  EImageState read(BinaryReader reader) =>
      _byIndex(EImageState.values, reader.readByte(), EImageState.none);

  @override
  void write(BinaryWriter writer, EImageState obj) =>
      writer.writeByte(obj.index);
}

class ESpecializationAdapter extends TypeAdapter<ESpecialization> {
  @override
  final int typeId = 101;

  @override
  ESpecialization read(BinaryReader reader) => _byIndex(
    ESpecialization.values,
    reader.readByte(),
    ESpecialization.values.first,
  );

  @override
  void write(BinaryWriter writer, ESpecialization obj) =>
      writer.writeByte(obj.index);
}

class EExperienceAdapter extends TypeAdapter<EExperience> {
  @override
  final int typeId = 102;

  @override
  EExperience read(BinaryReader reader) =>
      _byIndex(EExperience.values, reader.readByte(), EExperience.junior);

  @override
  void write(BinaryWriter writer, EExperience obj) =>
      writer.writeByte(obj.index);
}

class ELikedYouQuotaPeriodAdapter extends TypeAdapter<ELikedYouQuotaPeriod> {
  @override
  final int typeId = 103;

  @override
  ELikedYouQuotaPeriod read(BinaryReader reader) => _byIndex(
    ELikedYouQuotaPeriod.values,
    reader.readByte(),
    ELikedYouQuotaPeriod.weekly,
  );

  @override
  void write(BinaryWriter writer, ELikedYouQuotaPeriod obj) =>
      writer.writeByte(obj.index);
}

T _byIndex<T>(List<T> values, int index, T fallback) =>
    index < values.length ? values[index] : fallback;
