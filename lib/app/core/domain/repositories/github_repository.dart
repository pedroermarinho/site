

import 'package:dartz/dartz.dart';

import '../entities/github/repo.dart';
import '../entities/github/user.dart';
import '../errors/github_errors.dart';

abstract class GitHubRepository {
  Future<Either<ErrorGetRepo, List<Repo>>> getRepos();
  Future<Either<ErrorGetUser, User>> getUser();
}