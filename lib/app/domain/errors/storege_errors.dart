import 'generic_errors.dart';

class ErrorGetStorage extends GenericFailure {
  final String message;

  ErrorGetStorage({required this.message});
}

class ErrorPutStorage extends GenericFailure {
  final String message;

  ErrorPutStorage({required this.message});
}

class ErrorContainsKeyStorage extends GenericFailure {
  final String message;

  ErrorContainsKeyStorage({required this.message});
}

class ErrorClearStorage extends GenericFailure {
  final String message;

  ErrorClearStorage({required this.message});
}

class ErrorRemoveStorage extends GenericFailure {
  final String message;

  ErrorRemoveStorage({required this.message});
}
