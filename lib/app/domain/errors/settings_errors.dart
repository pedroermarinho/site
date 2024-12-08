abstract class SettingsFailure implements Exception {
  String get message;
}

class ErrorGetSettings extends SettingsFailure {
  final String message;

  ErrorGetSettings({required this.message});
}
