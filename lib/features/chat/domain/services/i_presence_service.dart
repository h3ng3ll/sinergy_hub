

import 'package:flutter/material.dart';

abstract class IPresenceService {
  Future<void> init();
  Future<void> onChangeState(AppLifecycleState state);
  Future<void> setOffline();
}