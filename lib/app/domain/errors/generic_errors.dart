abstract class GenericFailure implements Exception {
  String get message;
}

class FormatFailure extends GenericFailure {
  final String message;

  FormatFailure({required this.message});
}
