import 'package:dartz/dartz.dart';

import '../../data/repositories/github/github_repository.dart';
import '../entities/github/user.dart';
import '../errors/github_errors.dart';

abstract class GetUser {
  Future<Either<ErrorGetUser, User>> call();
}

class GetUserImpl implements GetUser {
  final GitHubRepository repository;

  GetUserImpl(this.repository);

  @override
  Future<Either<ErrorGetUser, User>> call() async => await repository.getUser();
}
