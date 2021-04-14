abstract class StorageFailure implements Exception {
  String get message;
}

class ErrorGetStorage extends StorageFailure {
  final String message;
  ErrorGetStorage({required this.message});
}

class ErrorPutStorage extends StorageFailure {
  final String message;
  ErrorPutStorage({required this.message});
}

class ErrorContainsKeyStorage extends StorageFailure {
  final String message;
  ErrorContainsKeyStorage({required this.message});
}

class ErrorClearStorage extends StorageFailure {
  final String message;
  ErrorClearStorage({required this.message});
}

class ErrorRemoveStorage extends StorageFailure {
  final String message;
  ErrorRemoveStorage({required this.message});
}
