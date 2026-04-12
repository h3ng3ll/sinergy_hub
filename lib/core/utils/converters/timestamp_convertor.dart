import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json == null) {
      return DateTime.now();
    }

    if (json is Timestamp) {
      return json.toDate();
    }

    if (json is String) {
      return DateTime.parse(json);
    }

    if (json is int) {
      // optional: handle millisecondsSinceEpoch
      return DateTime.fromMillisecondsSinceEpoch(json);
    }

    throw Exception('Invalid date format: $json');
  }

  @override
  Timestamp toJson(Object? date) {
    // Конвертируем DateTime → Firestore Timestamp
    return Timestamp.fromDate(
      date as DateTime,
    );
  }
}
