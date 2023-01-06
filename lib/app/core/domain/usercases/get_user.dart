import 'package:dartz/dartz.dart';

import '../entities/github/user.dart';
import '../errors/github_errors.dart';
import '../repositories/github_repository.dart';

abstract class GetUser {
  Future<Either<ErrorGetUser, User>> call();
}

class GetUserImpl implements GetUser {
  final GitHubRepository repository;

  GetUserImpl(this.repository);

  @override
  Future<Either<ErrorGetUser, User>> call() async => await repository.getUser();
}
