

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp? timestamp) {
    // Конвертируем Firestore Timestamp → DateTime
    return timestamp?.toDate() ?? DateTime.now();
  }

  @override
  Timestamp toJson(DateTime date) {
    // Конвертируем DateTime → Firestore Timestamp
    return Timestamp.fromDate(date);
  }
}