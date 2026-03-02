# Firebase Cloud Functions Service

## Overview

The `FirebaseFunctionsService` provides a clean, typed interface for interacting with Firebase Cloud Functions in your Flutter application following Clean Architecture principles.

## Installation

The service is already registered in the project. The following dependency was added to `pubspec.yaml`:

```yaml
dependencies:
  cloud_functions: ^6.0.0
```

Run:
```bash
flutter pub get
```

## Service Registration

The service is automatically registered in the DI container (`lib/core/di/injection.dart`):

```dart
getIt.registerLazySingleton<FirebaseFunctionsService>(
  () => FirebaseFunctionsService(
    firebaseFunctions: getIt<FirebaseFunctions>(),
  ),
);
```

## Basic Usage

### 1. Inject the Service

In your Use Case or Repository:

```dart
import 'package:get_it/get_it.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';

class MyUseCase {
  final FirebaseFunctionsService _functionsService;

  MyUseCase({
    FirebaseFunctionsService? functionsService,
  }) : _functionsService = functionsService ?? getIt<FirebaseFunctionsService>();

  Future<void> execute() async {
    // Use the service
  }
}
```

### 2. Call a Cloud Function

#### Simple Call

```dart
final result = await _functionsService.call(
  functionName: 'getUserData',
  data: {'userId': '123'},
);
```

#### Call with Custom Timeout

```dart
final result = await _functionsService.call(
  functionName: 'processPayment',
  data: {'amount': 100, 'currency': 'USD'},
  timeout: const Duration(seconds: 60),
);
```

#### Call with Custom Region

```dart
final result = await _functionsService.call(
  functionName: 'getEuropeanUserData',
  data: {'userId': '123'},
  region: 'europe-west1',
);
```

#### Typed Call

```dart
final userName = await _functionsService.callTyped<String>(
  functionName: 'getUserName',
  data: {'userId': '123'},
);

final userData = await _functionsService.callTyped<Map<String, dynamic>>(
  functionName: 'getUserProfile',
  data: {'userId': '123'},
);
```

## Error Handling

The service provides specific exception types for different error scenarios:

```dart
try {
  final result = await _functionsService.call(
    functionName: 'myFunction',
    data: {'key': 'value'},
  );
} on FunctionNotFoundException catch (e) {
  // Handle function not found
  print('Function not found: ${e.message}');
} on FunctionDeadlineExceededException catch (e) {
  // Handle timeout
  print('Function timed out: ${e.message}');
} on FunctionPermissionDeniedException catch (e) {
  // Handle permission issues
  print('Permission denied: ${e.message}');
} on FunctionUnauthenticatedException catch (e) {
  // Handle authentication issues
  print('User not authenticated: ${e.message}');
} on FunctionInternalException catch (e) {
  // Handle server-side errors
  print('Internal error: ${e.message}');
} on FunctionUnavailableException catch (e) {
  // Handle service unavailability
  print('Service unavailable: ${e.message}');
} on FirebaseFunctionException catch (e) {
  // Handle other Firebase Functions exceptions
  print('Function error: ${e.message}');
}
```

## Advanced Usage

### Get Function Reference

For advanced use cases where you need direct access to the function:

```dart
final functionRef = _functionsService.getFunction(
  functionName: 'myFunction',
  region: 'us-central1',
);

// Use the reference directly
final result = await functionRef.call(
  data: {'custom': 'data'},
  options: HttpsCallableOptions(
    timeout: const Duration(seconds: 30),
  ),
);
```

### Set Custom Headers

```dart
_functionsService.setCustomHeaders({
  'X-Custom-Header': 'value',
  'Authorization': 'Bearer token',
});
```

### Set Default Timeout

```dart
_functionsService.setDefaultTimeout(const Duration(seconds: 45));
```

## Example: Use Case Implementation

```dart
import 'package:get_it/get_it.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import '../domain/models/user.dart';

class FetchUserProfileUseCase {
  final FirebaseFunctionsService _functionsService;

  FetchUserProfileUseCase({
    FirebaseFunctionsService? functionsService,
  }) : _functionsService = functionsService ?? getIt<FirebaseFunctionsService>();

  Future<User> execute(String userId) async {
    try {
      final responseData = await _functionsService.call<Map<String, dynamic>>(
        functionName: 'getUserProfile',
        data: {'userId': userId},
        timeout: const Duration(seconds: 30),
      );

      return User.fromJson(responseData);
    } on FunctionNotFoundException {
      throw UserNotFoundException('User profile function not found');
    } on FunctionDeadlineExceededException {
      throw UserTimeoutException('Failed to fetch user profile: timeout');
    } on FunctionUnauthenticatedException {
      throw UserUnauthenticatedException('User must be authenticated');
    }
  }
}
```

## Example: Repository Implementation

```dart
import 'package:get_it/get_it.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import '../domain/repositories/i_payment_repository.dart';
import '../domain/models/payment_result.dart';

class FirebasePaymentRepository implements IPaymentRepository {
  final FirebaseFunctionsService _functionsService;

  FirebasePaymentRepository({
    FirebaseFunctionsService? functionsService,
  }) : _functionsService = functionsService ?? getIt<FirebaseFunctionsService>();

  @override
  Future<PaymentResult> processPayment({
    required String userId,
    required double amount,
    required String currency,
  }) async {
    try {
      final responseData = await _functionsService.call<Map<String, dynamic>>(
        functionName: 'processPayment',
        data: {
          'userId': userId,
          'amount': amount,
          'currency': currency,
        },
        timeout: const Duration(seconds: 60),
      );

      return PaymentResult.fromJson(responseData);
    } on FunctionPermissionDeniedException {
      throw PaymentPermissionException('Payment permission denied');
    } on FunctionInternalException {
      throw PaymentProcessingException('Payment processing failed');
    }
  }
}
```

## Testing

### Unit Test Example

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';
import '../../../test/core/services/firebase/firebase_functions_test_utils.dart';

void main() {
  late FirebaseFunctionsService functionsService;
  late MockFirebaseFunctions mockFirebaseFunctions;

  setUpAll(() {
    FirebaseFunctionsTestUtils.registerFallbacks();
  });

  setUp(() {
    mockFirebaseFunctions = FirebaseFunctionsTestUtils.createMockFunctions();
    functionsService = FirebaseFunctionsService(
      firebaseFunctions: mockFirebaseFunctions,
    );
  });

  test('should fetch user data successfully', () async {
    // Arrange
    const functionName = 'getUserData';
    final expectedResponse = {
      'userId': '123',
      'name': 'John Doe',
    };

    FirebaseFunctionsTestUtils.setupMockFunctions(
      mockFunctions: mockFirebaseFunctions,
      functionName: functionName,
      responseData: expectedResponse,
    );

    // Act
    final result = await functionsService.call(
      functionName: functionName,
      data: {'userId': '123'},
    );

    // Assert
    expect(result, equals(expectedResponse));
  });
}
```

## Best Practices

1. **Always use Use Cases**: Don't call the service directly from BLoCs or UI layers
2. **Handle exceptions appropriately**: Catch specific exception types
3. **Set reasonable timeouts**: Default is 30 seconds, adjust based on function complexity
4. **Use typed calls**: When you know the return type, use `callTyped<T>()`
5. **Keep functions focused**: Each Cloud Function should do one thing well
6. **Test thoroughly**: Use the provided test utilities to mock function calls

## Available Exception Types

- `FunctionCancelledException`
- `FunctionUnknownException`
- `FunctionInvalidArgumentException`
- `FunctionDeadlineExceededException`
- `FunctionNotFoundException`
- `FunctionAlreadyExistsException`
- `FunctionPermissionDeniedException`
- `FunctionResourceExhaustedException`
- `FunctionFailedPreconditionException`
- `FunctionAbortedException`
- `FunctionOutOfRangeException`
- `FunctionUnimplementedException`
- `FunctionInternalException`
- `FunctionUnavailableException`
- `FunctionDataLossException`
- `FunctionUnauthenticatedException`

## Related Files

- Service: `lib/core/services/firebase/firebase_functions_service.dart`
- DI Registration: `lib/core/di/injection.dart`
- Tests: `test/core/services/firebase/firebase_functions_service_test.dart`
- Test Utilities: `test/core/services/firebase/firebase_functions_test_utils.dart`
