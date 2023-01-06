import 'package:dartz/dartz.dart';

import '../entities/github/repo.dart';
import '../errors/github_errors.dart';
import '../repositories/github_repository.dart';

abstract class GetRepo {
  Future<Either<ErrorGetRepo, List<Repo>>> call();
}

class GetRepoImpl implements GetRepo {
  final GitHubRepository repository;

  GetRepoImpl(this.repository);

  @override
  Future<Either<ErrorGetRepo, List<Repo>>> call() async =>
      (await repository.getRepos()).fold((l) => Left(l), (r) {
        r.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
        return Right(r);
      });
}
