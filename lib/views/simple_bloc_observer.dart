import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // implement onChange
    debugPrint('change = $change');
  }

  @override
  void onClose(BlocBase bloc) {
    // implement onClose
    debugPrint('close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    // implement onCreate
    debugPrint('create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
