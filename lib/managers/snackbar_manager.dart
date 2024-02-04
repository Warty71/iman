import 'dart:async';

class SnackbarManager {
  static final SnackbarManager _instance = SnackbarManager._internal();
  factory SnackbarManager() => _instance;

  SnackbarManager._internal();

  final _snackbarController = StreamController<String>.broadcast();
  Stream<String> get snackbarStream =>
      _snackbarController.stream.asBroadcastStream();

  void showSnackbar(String message) {
    _snackbarController.sink.add(message);
  }
}
