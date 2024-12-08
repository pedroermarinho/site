abstract class GithubFailure implements Exception {
  String get message;
}

class ErrorGetRepo extends GithubFailure {
  final String message;

  ErrorGetRepo({required this.message});
}

class ErrorGetUser extends GithubFailure {
  final String message;

  ErrorGetUser({required this.message});
}
