import 'package:result_dart/result_dart.dart';

import '../../data/repositories/github/github_repository.dart';
import '../entities/github/user.dart';

abstract class GetUser {
  Future<Result<User>> call();
}

class GetUserImpl implements GetUser {
  final GitHubRepository repository;

  GetUserImpl(this.repository);

  @override
  Future<Result<User>> call() async => await repository.getUser();
}
