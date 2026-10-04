
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver extends BlocObserver {

  static AppObserver? _singleton ;

  AppObserver._();
  factory AppObserver.instance() => _singleton ??= AppObserver._();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('[Create] $bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('[Event] in $bloc: $event');
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('[Change] state in $bloc from ${change.currentState} -> ${change.nextState}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('[Transition] in $bloc from ${transition.currentState} -> ${transition.nextState}');
  }
  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
    debugPrint('[Close] $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    debugPrint('Error in $bloc: $error\nStacktrace: $stackTrace');
  }
}