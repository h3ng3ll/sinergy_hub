import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/features/subscription/domain/models/premium_status/premium_status.dart';

void main() {
  group('PremiumStatus.fromJson', () {
    test('parses a fully populated active document', () {
      final expiresAt = DateTime.utc(2026, 1, 1);
      final updatedAt = DateTime.utc(2025, 12, 1);

      final status = PremiumStatus.fromJson({
        'isActive': true,
        'entitlementId': 'premium',
        'productId': 'premium_annual',
        'store': 'APP_STORE',
        'periodType': 'NORMAL',
        'expiresAt': Timestamp.fromDate(expiresAt),
        'willRenew': true,
        'updatedAt': Timestamp.fromDate(updatedAt),
      });

      expect(status.isActive, true);
      expect(status.entitlementId, 'premium');
      expect(status.productId, 'premium_annual');
      expect(status.store, 'APP_STORE');
      expect(status.periodType, 'NORMAL');
      expect(status.expiresAt?.toUtc(), expiresAt);
      expect(status.willRenew, true);
      expect(status.updatedAt?.toUtc(), updatedAt);
    });

    test('a document missing every field degrades to Free-shaped defaults', () {
      final status = PremiumStatus.fromJson(const {});

      expect(status.isActive, false);
      expect(status.entitlementId, '');
      expect(status.productId, '');
      expect(status.store, '');
      expect(status.periodType, '');
      expect(status.expiresAt, isNull);
      expect(status.willRenew, false);
      expect(status.updatedAt, isNull);
    });

    test('malformed field types never throw and fall back to defaults', () {
      final status = PremiumStatus.fromJson({
        'isActive': 'not-a-bool',
        'expiresAt': 12345,
        'willRenew': 'not-a-bool',
      });

      expect(status.isActive, false);
      expect(status.willRenew, false);
      expect(status.expiresAt, isNull);
    });

    test('accepts an ISO string date as a fallback to Timestamp', () {
      final status = PremiumStatus.fromJson({
        'expiresAt': '2026-01-01T00:00:00.000Z',
      });

      expect(status.expiresAt, DateTime.parse('2026-01-01T00:00:00.000Z'));
    });
  });
}
