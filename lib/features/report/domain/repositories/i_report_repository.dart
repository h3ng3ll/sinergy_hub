abstract class IReportRepository {
  /// Submits a complaint about [reportedUserId] to the backend for
  /// processing. The backend also enforces spam rate-limiting and may
  /// throw a `resource-exhausted` error.
  Future<void> report({
    required String reportedUserId,
    required String reason,
    required String details,
  });
}
