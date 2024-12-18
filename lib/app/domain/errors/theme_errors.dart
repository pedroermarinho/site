import 'generic_errors.dart';

class ErrorGetTheme extends GenericFailure {
  final String message;

  ErrorGetTheme({required this.message});
}

class ErrorSetTheme extends GenericFailure {
  final String message;

  ErrorSetTheme({required this.message});
}
