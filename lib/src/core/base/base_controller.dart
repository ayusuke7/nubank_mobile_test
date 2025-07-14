import 'dart:async';

import 'package:flutter/foundation.dart';

import 'base_state.dart';

abstract class BaseController<T extends BaseState>
    implements ValueListenable<T> {
  late final ValueNotifier<T> _stateNotifier;

  T get state => _stateNotifier.value;

  @override
  T get value => _stateNotifier.value;

  /// create instance of `BaseController` with initial state [T].
  ///
  /// [initialState] initial state for the controller.
  BaseController(T initialState) {
    _stateNotifier = ValueNotifier<T>(initialState);
    initController();
  }

  @mustCallSuper
  initController() {}

  /// Convert from [BaseController] to [stream].
  Stream<T> asStream() {
    late StreamController<T> controller;

    void listen() {
      controller.add(_stateNotifier.value);
    }

    controller = StreamController<T>(
      onListen: () {
        _stateNotifier.addListener(listen);
      },
      onCancel: () {
        _stateNotifier.removeListener(listen);
      },
    );

    return controller.stream;
  }

  /// Added a listener that will be called every time the state changes.
  ///
  /// [listener] Callback function to be called when the state changes.
  @override
  void addListener(VoidCallback listener) {
    _stateNotifier.addListener(listener);
  }

  /// Remove listener added with [addListener].
  ///
  /// [listener] The listener to be removed.
  @override
  void removeListener(VoidCallback listener) {
    _stateNotifier.removeListener(listener);
  }

  /// Update the state with the new state.
  ///
  /// [newState] The new state to be updated.
  void update(T newState) {
    middleware(newState);
  }

  void _update(T newState) {
    _stateNotifier.value = newState;
  }

  /// Middleware for update the state.
  @protected
  void middleware(T newState) {
    _update(newState);
  }

  /// Dispose the controller.
  void dispose() {
    _stateNotifier.dispose();
  }
}
