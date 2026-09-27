import 'package:flutter/material.dart';

/// Overriding gloom effect
class CustomCustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
