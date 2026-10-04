import '../../../../core/services/firebase/firebase_firestore_service.dart';
import '../../../../core/services/firebase/firebase_functions_service.dart';
import '../../domain/exceptions/background_palette_premium_required_exception.dart';
import '../../domain/models/background_palette/background_palette.dart';
import '../../domain/repositories/i_background_palette_repository.dart';

class BackgroundPaletteFirebaseRepository
    implements IBackgroundPaletteRepository {
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseFunctionsService _firebaseFunctionsService;

  BackgroundPaletteFirebaseRepository({
    required this._firebaseFirestoreService,
    required this._firebaseFunctionsService,
  });

  static const String _setFunctionName = 'setBackgroundPalette';

  @override
  Future<BackgroundPalette?> get({
    required String uid,
  }) async {
    final snapshot = await _firebaseFirestoreService
        .appearancePalette(uid: uid)
        .get();
    final data = snapshot.data();
    if (!snapshot.exists || data == null) return null;
    return _parse(data);
  }

  @override
  Future<BackgroundPalette?> set({
    required BackgroundPalette? palette,
  }) async {
    try {
      final dynamic result = await _firebaseFunctionsService.call(
        functionName: _setFunctionName,
        data: palette?.toJson() ?? {'reset': true},
      );
      final stored = result is Map ? result['palette'] : null;
      if (stored is! Map) return null;
      return _parse(Map<String, dynamic>.from(stored));
    } on FunctionPermissionDeniedException catch (e) {
      throw BackgroundPalettePremiumRequiredException(e.message);
    }
  }

  /// A malformed palette falls back to the default instead of throwing.
  BackgroundPalette? _parse(Map<String, dynamic> data) {
    try {
      return BackgroundPalette.fromJson(data);
    } catch (_) {
      return null;
    }
  }
}
