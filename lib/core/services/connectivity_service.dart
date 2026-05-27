import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool? _lastIsOnline;

  Stream<bool> get stream => _controller.stream;

  bool get isOnline => _lastIsOnline ?? true;

  bool get isInitialised => _lastIsOnline != null;

  /// Seeds the current connectivity status synchronously before runApp so
  /// the first frame and the GoRouter redirect already know whether the
  /// device is online, then subscribes to the OS stream for the rest of
  /// the app lifetime. Call [dispose] from MyApp.dispose() to tear down.
  Future<void> init() async {
    if (_subscription != null) return;

    final initial = await _connectivity.checkConnectivity();
    _lastIsOnline = _isOnlineFromResults(initial);

    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) => _emit(_isOnlineFromResults(results)),
    );
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    await _controller.close();
  }

  void _emit(bool isOnline) {
    if (_lastIsOnline == isOnline) return;
    _lastIsOnline = isOnline;
    _controller.add(isOnline);
  }

  bool _isOnlineFromResults(List<ConnectivityResult> results) {
    if (results.isEmpty) return false;
    return !results.every((r) => r == ConnectivityResult.none);
  }
}
