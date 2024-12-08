import 'package:dartz/dartz.dart';

import '../../data/repositories/github/github_repository.dart';
import '../entities/github/repo.dart';
import '../errors/github_errors.dart';

abstract class GetRepo {
  Future<Either<ErrorGetRepo, List<Repo>>> call();
}

class GetRepoImpl implements GetRepo {
  final GitHubRepository repository;

  GetRepoImpl(this.repository);

  @override
  Future<Either<ErrorGetRepo, List<Repo>>> call() async => (await repository.getRepos()).fold(Left.new, (r) {
        r.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
        return Right(r);
      });
}
