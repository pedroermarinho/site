abstract class ThemeFailure implements Exception {
  String get message;
}

class ErrorGetTheme extends ThemeFailure {
  final String message;

  ErrorGetTheme({required this.message});
}

class ErrorSetTheme extends ThemeFailure {
  final String message;

  ErrorSetTheme({required this.message});
}
