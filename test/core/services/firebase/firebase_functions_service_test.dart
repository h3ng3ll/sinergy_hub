import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_functions_service.dart';

import 'firebase_functions_test_utils.dart';

void main() {
  late FirebaseFunctionsService functionsService;
  late MockFirebaseFunctions mockFirebaseFunctions;
  late MockHttpsCallable mockCallable;

  setUpAll(() {
    FirebaseFunctionsTestUtils.registerFallbacks();
  });

  setUp(() {
    mockFirebaseFunctions = FirebaseFunctionsTestUtils.createMockFunctions();
    mockCallable = FirebaseFunctionsTestUtils.createMockCallable();

    functionsService = FirebaseFunctionsService(
      firebaseFunctions: mockFirebaseFunctions,
    );

    // Setup default mock behavior
    when(() => mockFirebaseFunctions.httpsCallable(
      any(),
      options: any(named: 'options'),
    )).thenReturn(mockCallable);
  });

  group('FirebaseFunctionsService Tests', () {
    test('should call function successfully with data', () async {
      // Arrange
      const functionName = 'getUserData';
      final testData = {'userId': '123', 'includeProfile': true};
      final expectedResponse = {
        'userId': '123',
        'name': 'John Doe',
        'email': 'john@example.com',
      };
      final mockResult = MockHttpsCallableResult();

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockResult.data).thenReturn(expectedResponse);
      when(() => mockCallable.call(any())).thenAnswer((_) async => mockResult);

      // Act
      final result = await functionsService.call(
        functionName: functionName,
        data: testData,
      );

      // Assert
      expect(result, equals(expectedResponse));
      verify(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).called(1);
      verify(() => mockCallable.call(any())).called(1);
    });

    test('should call function without data', () async {
      // Arrange
      const functionName = 'getServerTime';
      final expectedResponse = {'timestamp': 1234567890};
      final mockResult = MockHttpsCallableResult();

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockResult.data).thenReturn(expectedResponse);
      when(() => mockCallable.call(any())).thenAnswer((_) async => mockResult);

      // Act
      final result = await functionsService.call(
        functionName: functionName,
      );

      // Assert
      expect(result, equals(expectedResponse));
    });

    test('should call function with custom timeout', () async {
      // Arrange
      const functionName = 'processPayment';
      const customTimeout = Duration(seconds: 60);
      final mockResult = MockHttpsCallableResult();

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockResult.data).thenReturn({'success': true});
      when(() => mockCallable.call(any())).thenAnswer((invocation) async {
        return mockResult;
      });

      // Act
      await functionsService.call(
        functionName: functionName,
        timeout: customTimeout,
      );

      // Verify timeout was passed correctly
      verify(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options', that: isA<HttpsCallableOptions>()
          .having((o) => o.timeout, 'timeout', equals(customTimeout)),
        ),
      )).called(1);
    });

    test('should create service for custom region', () async {
      // Arrange
      final mockRegionalFunctions = FirebaseFunctionsTestUtils.createMockFunctions();

      // Act
      final regionalService = FirebaseFunctionsService(
        firebaseFunctions: mockRegionalFunctions,
      );

      // Assert
      expect(regionalService, isNotNull);
      expect(regionalService, isA<FirebaseFunctionsService>());
    });

    test('should call typed function and return correct type', () async {
      // Arrange
      const functionName = 'getUserName';
      const expectedName = 'John Doe';
      final mockResult = MockHttpsCallableResult();

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockResult.data).thenReturn(expectedName);
      when(() => mockCallable.call(any())).thenAnswer((_) async => mockResult);

      // Act
      final result = await functionsService.callTyped<String>(
        functionName: functionName,
      );

      // Assert
      expect(result, isA<String>());
      expect(result, equals(expectedName));
    });

    test('should throw FunctionNotFoundException when function not found', () async {
      // Arrange
      const functionName = 'nonExistentFunction';

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockCallable.call(any())).thenThrow(
        FirebaseFunctionsException(
          code: 'not-found',
          message: 'Function not found',
          details: null,
        ),
      );

      // Act & Assert
      expect(
        () => functionsService.call(functionName: functionName),
        throwsA(isA<FunctionNotFoundException>()),
      );
    });

    test('should throw FunctionDeadlineExceededException on timeout', () async {
      // Arrange
      const functionName = 'slowFunction';

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockCallable.call(any())).thenThrow(
        FirebaseFunctionsException(
          code: 'deadline-exceeded',
          message: 'Deadline exceeded',
          details: null,
        ),
      );

      // Act & Assert
      expect(
        () => functionsService.call(functionName: functionName),
        throwsA(isA<FunctionDeadlineExceededException>()),
      );
    });

    test('should throw FunctionPermissionDeniedException', () async {
      // Arrange
      const functionName = 'restrictedFunction';

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockCallable.call(any())).thenThrow(
        FirebaseFunctionsException(
          code: 'permission-denied',
          message: 'Permission denied',
          details: null,
        ),
      );

      // Act & Assert
      expect(
        () => functionsService.call(functionName: functionName),
        throwsA(isA<FunctionPermissionDeniedException>()),
      );
    });

    test('should throw FunctionUnauthenticatedException', () async {
      // Arrange
      const functionName = 'authRequiredFunction';

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockCallable.call(any())).thenThrow(
        FirebaseFunctionsException(
          code: 'unauthenticated',
          message: 'Unauthenticated',
          details: null,
        ),
      );

      // Act & Assert
      expect(
        () => functionsService.call(functionName: functionName),
        throwsA(isA<FunctionUnauthenticatedException>()),
      );
    });

    test('should throw FunctionInternalException for internal errors', () async {
      // Arrange
      const functionName = 'failingFunction';

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockCallable.call(any())).thenThrow(
        FirebaseFunctionsException(
          code: 'internal',
          message: 'Internal error',
          details: null,
        ),
      );

      // Act & Assert
      expect(
        () => functionsService.call(functionName: functionName),
        throwsA(isA<FunctionInternalException>()),
      );
    });

    test('should get function reference without calling', () {
      // Arrange
      const functionName = 'myFunction';

      // Act
      final functionRef = functionsService.getFunction(functionName: functionName);

      // Assert
      expect(functionRef, isNotNull);
      verify(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).called(1);
    });

    test('should get function reference with custom timeout', () {
      // Arrange
      const functionName = 'myFunction';
      const customTimeout = Duration(seconds: 45);

      // Act
      final functionRef = functionsService.getFunction(
        functionName: functionName,
        timeout: customTimeout,
      );

      // Assert
      expect(functionRef, isNotNull);
      verify(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options', that: isA<HttpsCallableOptions>()
          .having((o) => o.timeout, 'timeout', equals(customTimeout)),
        ),
      )).called(1);
    });

    test('should handle unknown exception and wrap in FirebaseFunctionsException', () async {
      // Arrange
      const functionName = 'errorFunction';

      when(() => mockFirebaseFunctions.httpsCallable(
        functionName,
        options: any(named: 'options'),
      )).thenReturn(mockCallable);
      when(() => mockCallable.call(any())).thenThrow(Exception('Unexpected error'));

      // Act & Assert
      expect(
        () => functionsService.call(functionName: functionName),
        throwsA(isA<FirebaseFunctionsException>().having(
          (e) => e.code,
          'code',
          equals('unknown-error'),
        )),
      );
    });
  });
}
