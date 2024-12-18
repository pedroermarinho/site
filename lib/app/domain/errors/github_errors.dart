import 'generic_errors.dart';

class ErrorGetRepo extends GenericFailure {
  final String message;

  ErrorGetRepo({required this.message});
}

class ErrorGetUser extends GenericFailure {
  final String message;

  ErrorGetUser({required this.message});
}
