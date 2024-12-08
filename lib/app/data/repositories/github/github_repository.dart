import 'package:dartz/dartz.dart';

import '../../../domain/entities/github/repo.dart';
import '../../../domain/entities/github/user.dart';
import '../../../domain/errors/github_errors.dart';

abstract class GitHubRepository {
  Future<Either<ErrorGetRepo, List<Repo>>> getRepos();

  Future<Either<ErrorGetUser, User>> getUser();
}
