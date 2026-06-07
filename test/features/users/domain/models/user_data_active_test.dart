import 'package:flutter_test/flutter_test.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';

void main() {
  final active1 = UserData.none().copyWith(uid: 'A');
  final deleted = UserData.none().copyWith(uid: 'B', isDeleted: true);
  final active2 = UserData.none().copyWith(uid: 'C');

  group('UserData isActive / whereActive', () {
    test('isActive is true for a normal user and false for a deleted one', () {
      expect(active1.isActive, isTrue);
      expect(deleted.isActive, isFalse);
    });

    test('whereActive drops deleted users from a list', () {
      final result = [active1, deleted, active2].whereActive().toList();
      expect(result.map((u) => u.uid).toList(), ['A', 'C']);
    });

    test('whereActive keeps an all-active list unchanged', () {
      final result = [active1, active2].whereActive().toList();
      expect(result.map((u) => u.uid).toList(), ['A', 'C']);
    });
  });
}
