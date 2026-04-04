import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterX on BuildContext {
  void goBack() {
    if (kIsWeb) {
      if (canPop()) {
        pop();
        return;
      }
      final router = GoRouter.of(
        this,
      );
      final uri = router.routeInformationProvider.value.uri;

      final segments = uri.pathSegments;

      if (segments.isEmpty) {
        go('/');
        return;
      }

      // удаляем последний сегмент
      final newSegments = List<String>.from(
        segments,
      )..removeLast();

      final newPath = '/${newSegments.join('/')}';

      go(
        newPath.isEmpty ? '/' : newPath,
      );
    } else {
      // Mobile → стек
      if (canPop()) {
        pop();
      } else {
        go('/');
      }
    }
  }
}
