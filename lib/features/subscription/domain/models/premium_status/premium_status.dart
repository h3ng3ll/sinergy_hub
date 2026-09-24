import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'premium_status.freezed.dart';

/// Mirrors the backend-owned `subscriptions/{uid}` Firestore document.
///
/// The client never writes this document — it is populated by the RevenueCat
/// webhook handler. A missing document, or one that fails to parse, means
/// Free — see [PremiumStatus.fromJson].
@freezed
sealed class PremiumStatus with _$PremiumStatus {
  const factory PremiumStatus({
    @Default(false) bool isActive,
    @Default('') String entitlementId,
    @Default('') String productId,
    @Default('') String store,
    @Default('') String periodType,
    DateTime? expiresAt,
    @Default(false) bool willRenew,
    DateTime? updatedAt,
  }) = _PremiumStatus;

  /// Hand-written on purpose: the source is a Firestore document, whose
  /// `Timestamp` fields `json_serializable` cannot decode on its own, and a
  /// malformed field must degrade to the field's default rather than throw.
  factory PremiumStatus.fromJson(Map<String, dynamic> json) {
    return PremiumStatus(
      isActive: _boolFromJson(json['isActive']),
      entitlementId: _stringFromJson(json['entitlementId']),
      productId: _stringFromJson(json['productId']),
      store: _stringFromJson(json['store']),
      periodType: _stringFromJson(json['periodType']),
      expiresAt: _dateTimeFromJson(json['expiresAt']),
      willRenew: _boolFromJson(json['willRenew']),
      updatedAt: _dateTimeFromJson(json['updatedAt']),
    );
  }
}

// The `is` checks below (rather than `as X?` casts) are deliberate: a
// Firestore document with a field of the wrong type must degrade to the
// field's default, never throw a TypeError while parsing.
bool _boolFromJson(Object? value) => value is bool ? value : false;

String _stringFromJson(Object? value) => value is String ? value : '';

DateTime? _dateTimeFromJson(Object? value) {
  if (value is Timestamp) return value.toDate();
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value);
  return null;
}
