import 'package:cloud_functions/cloud_functions.dart';
import 'package:mocktail/mocktail.dart';

/// Mock class for FirebaseFunctions
class MockFirebaseFunctions extends Mock implements FirebaseFunctions {}

/// Mock class for HttpsCallable
class MockHttpsCallable extends Mock implements HttpsCallable {}

/// Mock class for HttpsCallableResult
class MockHttpsCallableResult extends Mock implements HttpsCallableResult {}

/// Fake class for HttpsCallableOptions
class FakeHttpsCallableOptions extends Fake implements HttpsCallableOptions {}

/// Test utilities for Firebase Functions Service
class FirebaseFunctionsTestUtils {
  /// Create a mock FirebaseFunctions instance
  static MockFirebaseFunctions createMockFunctions() {
    return MockFirebaseFunctions();
  }

  /// Create a mock HttpsCallable instance
  static MockHttpsCallable createMockCallable() {
    return MockHttpsCallable();
  }

  /// Create a mock HttpsCallableResult instance
  static MockHttpsCallableResult createMockResult({
    dynamic data,
  }) {
    final mockResult = MockHttpsCallableResult();
    when(() => mockResult.data).thenReturn(data);
    return mockResult;
  }

  /// Setup common stubs for FirebaseFunctions mock
  static void setupMockFunctions({
    required MockFirebaseFunctions mockFunctions,
    MockHttpsCallable? mockCallable,
    String? functionName,
    dynamic responseData,
  }) {
    if (mockCallable != null && functionName != null) {
      when(() => mockFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);

      if (responseData != null) {
        final mockResult = MockHttpsCallableResult();
        when(() => mockResult.data).thenReturn(responseData);
        when(() => mockCallable.call(any())).thenAnswer((_) async => mockResult);
      }
    }
  }

  /// Register fallbacks for mocktail
  static void registerFallbacks() {
    registerFallbackValue(FakeHttpsCallableOptions());
  }
}
