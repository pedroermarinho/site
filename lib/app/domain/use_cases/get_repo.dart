import 'package:result_dart/result_dart.dart';

import '../../data/repositories/github/github_repository.dart';
import '../entities/github/repo.dart';

abstract class GetRepo {
  Future<Result<List<Repo>>> call();
}

class GetRepoImpl implements GetRepo {
  final GitHubRepository repository;

  GetRepoImpl(this.repository);

  @override
  Future<Result<List<Repo>>> call() async => (await repository.getRepos()).fold(
        (r) {
          r.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
          return Success(r);
        },
        Failure.new,
      );
}
