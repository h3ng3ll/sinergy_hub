import 'package:cloud_functions/cloud_functions.dart';

import '../../utils/app_config.dart';

/// Service for interacting with Firebase Cloud Functions
/// 
/// Provides methods to call HTTPS callable functions and manage function connections.
/// 
/// Usage example:
/// ```dart
/// final functionsService = getIt<FirebaseFunctionsService>();
/// 
/// // Call a function with data
/// final result = await functionsService.call(
///   functionName: 'getUserData',
///   data: {'userId': '123'},
/// );
/// 
/// // Call a function with timeout
/// final result = await functionsService.call(
///   functionName: 'processPayment',
///   data: {'amount': 100},
///   timeout: const Duration(seconds: 30),
/// );
/// ```
class FirebaseFunctionsService {
  final FirebaseFunctions _firebaseFunctions;

  FirebaseFunctionsService({
    FirebaseFunctions? firebaseFunctions,
  }) : _firebaseFunctions = firebaseFunctions ?? FirebaseFunctions.instance {
    if(AppConfig.isQA) {
      _firebaseFunctions.useFunctionsEmulator(
        AppConfig.emulatorAddress(),
        AppConfig.functionsEmulatorPort,
      );
    }
  }

  /// Call a Firebase Cloud Function by name
  /// 
  /// [functionName] - The name of the Cloud Function to call
  /// [data] - Optional data to pass to the function
  /// [timeout] - Optional timeout for the function call (default: 30 seconds)
  /// [region] - Optional region override (default: us-central1)
  /// 
  /// Returns the result from the Cloud Function
  Future<dynamic> call({
    required String functionName,
    dynamic data,
    Duration timeout = const Duration(seconds: 30),
    String? region,
  }) async {
    try {
      final function = _firebaseFunctions.httpsCallable(
        functionName,
        options: HttpsCallableOptions(
          timeout: timeout,
        ),
      );

      final result = await function.call(data);

      return result.data;
    } on FirebaseFunctionsException catch (e) {
      throw _handleFunctionException(e);
    } catch (e) {
      throw FirebaseFunctionsException(
        code: 'unknown-error',
        message: 'Failed to call function: $functionName. Error: $e',
        details: null,
      );
    }
  }

  /// Call a Firebase Cloud Function and get a typed result
  /// 
  /// Use this when you know the expected return type
  /// 
  /// [functionName] - The name of the Cloud Function to call
  /// [data] - Optional data to pass to the function
  /// [timeout] - Optional timeout for the function call
  /// 
  /// Returns the result cast to type [T]
  Future<T> callTyped<T>({
    required String functionName,
    dynamic data,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final result = await call(
      functionName: functionName,
      data: data,
      timeout: timeout,
    );
    return result as T;
  }

  /// Get a reference to a Cloud Function without calling it
  /// 
  /// Useful for advanced use cases where you need direct access
  HttpsCallable getFunction({
    required String functionName,
    Duration timeout = const Duration(seconds: 30),
  }) {
    return _firebaseFunctions.httpsCallable(
      functionName,
      options: HttpsCallableOptions(
        timeout: timeout,
      ),
    );
  }

  /// Get a FirebaseFunctionsService instance for a specific region
  /// 
  /// [region] - The region for the Cloud Functions (e.g., 'europe-west1')
  /// 
  /// Returns a new instance configured for the specified region
  FirebaseFunctionsService forRegion(String region) {
    return FirebaseFunctionsService(
      firebaseFunctions: FirebaseFunctions.instanceFor(region: region),
    );
  }

  /// Handle Firebase Functions exceptions
  Exception _handleFunctionException(FirebaseFunctionsException e) {
    switch (e.code) {
      case 'cancelled':
        return FunctionCancelledException(e.message);
      case 'unknown':
        return FunctionUnknownException(e.message);
      case 'invalid-argument':
        return FunctionInvalidArgumentException(e.message);
      case 'deadline-exceeded':
        return FunctionDeadlineExceededException(e.message);
      case 'not-found':
        return FunctionNotFoundException(e.message);
      case 'already-exists':
        return FunctionAlreadyExistsException(e.message);
      case 'permission-denied':
        return FunctionPermissionDeniedException(e.message);
      case 'resource-exhausted':
        return FunctionResourceExhaustedException(e.message);
      case 'failed-precondition':
        return FunctionFailedPreconditionException(e.message);
      case 'aborted':
        return FunctionAbortedException(e.message);
      case 'out-of-range':
        return FunctionOutOfRangeException(e.message);
      case 'unimplemented':
        return FunctionUnimplementedException(e.message);
      case 'internal':
        return FunctionInternalException(e.message);
      case 'unavailable':
        return FunctionUnavailableException(e.message);
      case 'data-loss':
        return FunctionDataLossException(e.message);
      case 'unauthenticated':
        return FunctionUnauthenticatedException(e.message);
      default:
        return FunctionUnknownException(e.message);
    }
  }
}

/// Base exception for Firebase Functions errors
abstract class FirebaseFunctionException implements Exception {
  final String? message;
  FirebaseFunctionException(this.message);

  @override
  String toString() => 'FirebaseFunctionException: $message';
}

/// Specific exception types for better error handling
class FunctionCancelledException extends FirebaseFunctionException {
  FunctionCancelledException(super.message);
}

class FunctionUnknownException extends FirebaseFunctionException {
  FunctionUnknownException(super.message);
}

class FunctionInvalidArgumentException extends FirebaseFunctionException {
  FunctionInvalidArgumentException(super.message);
}

class FunctionDeadlineExceededException extends FirebaseFunctionException {
  FunctionDeadlineExceededException(super.message);
}

class FunctionNotFoundException extends FirebaseFunctionException {
  FunctionNotFoundException(super.message);
}

class FunctionAlreadyExistsException extends FirebaseFunctionException {
  FunctionAlreadyExistsException(super.message);
}

class FunctionPermissionDeniedException extends FirebaseFunctionException {
  FunctionPermissionDeniedException(super.message);
}

class FunctionResourceExhaustedException extends FirebaseFunctionException {
  FunctionResourceExhaustedException(super.message);
}

class FunctionFailedPreconditionException extends FirebaseFunctionException {
  FunctionFailedPreconditionException(super.message);
}

class FunctionAbortedException extends FirebaseFunctionException {
  FunctionAbortedException(super.message);
}

class FunctionOutOfRangeException extends FirebaseFunctionException {
  FunctionOutOfRangeException(super.message);
}

class FunctionUnimplementedException extends FirebaseFunctionException {
  FunctionUnimplementedException(super.message);
}

class FunctionInternalException extends FirebaseFunctionException {
  FunctionInternalException(super.message);
}

class FunctionUnavailableException extends FirebaseFunctionException {
  FunctionUnavailableException(super.message);
}

class FunctionDataLossException extends FirebaseFunctionException {
  FunctionDataLossException(super.message);
}

class FunctionUnauthenticatedException extends FirebaseFunctionException {
  FunctionUnauthenticatedException(super.message);
}
