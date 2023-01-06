
import '../../domain/entities/github/repo.dart';
import '../../domain/entities/github/user.dart';
import '../../domain/errors/github_errors.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/github_repository.dart';
import '../datasources/github_datasource.dart';

class GitHubRepositoryImpl implements GitHubRepository {
  final GitHubDataSource dataSource;

  GitHubRepositoryImpl(this.dataSource);

  @override
  Future<Either<ErrorGetRepo, List<Repo>>> getRepos() async =>
      await dataSource.getRepos();

  @override
  Future<Either<ErrorGetUser, User>> getUser() async =>
      await dataSource.getUser();

}