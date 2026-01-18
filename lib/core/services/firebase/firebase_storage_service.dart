import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage;

  FirebaseStorageService({
    FirebaseStorage? storage,
  }) : _storage = storage ?? FirebaseStorage.instance;

  /// ------------------------------------------------------------
  /// Refs
  /// ------------------------------------------------------------

  Reference ref(String path) => _storage.ref(path);

  /// ------------------------------------------------------------
  /// Upload
  /// ------------------------------------------------------------

  /// Upload file from device
  UploadTask uploadFile({
    required String path,
    required File file,
    SettableMetadata? metadata,
  }) {
    return ref(path).putFile(
      file,
      metadata,
    );
  }

  /// Upload raw bytes (web / memory)
  UploadTask uploadBytes({
    required String path,
    required Uint8List bytes,
    SettableMetadata? metadata,
  }) {
    return ref(path).putData(
      bytes,
      metadata,
    );
  }

  /// Upload with await → download url
  Future<String> uploadFileAndGetUrl({
    required String path,
    required File file,
    SettableMetadata? metadata,
  }) async {
    final task = uploadFile(
      path: path,
      file: file,
      metadata: metadata,
    );

    final snapshot = await task;
    return snapshot.ref.getDownloadURL();
  }

  /// ------------------------------------------------------------
  /// Download
  /// ------------------------------------------------------------

  Future<Uint8List?> downloadBytes(
    String path, {
    int maxSizeInBytes = 10 * 1024 * 1024, // 10MB
  }) {
    return ref(
      path,
    ).getData(
      maxSizeInBytes,
    );
  }

  Future<String> getDownloadUrl(String path) {
    return ref(
      path,
    ).getDownloadURL();
  }

  /// ------------------------------------------------------------
  /// Delete
  /// ------------------------------------------------------------

  Future<void> delete(String path) {
    return ref(path).delete();
  }

  /// ------------------------------------------------------------
  /// Exists
  /// ------------------------------------------------------------

  Future<bool> exists(String path) async {
    try {
      await ref(
        path,
      ).getMetadata();
      return true;
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return false;
      }
      rethrow;
    }
  }

  /// ------------------------------------------------------------
  /// Utils
  /// ------------------------------------------------------------

  /// Cancel upload task safely
  Future<void> cancelUpload(UploadTask task) async {
    await task.cancel();
  }
}
