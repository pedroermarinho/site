import 'package:result_dart/result_dart.dart';

import '../../data/repositories/github/github_repository.dart';
import '../entities/github/repo.dart';

abstract class GetRepo {
  AsyncResult<List<Repo>> call();
}

class GetRepoImpl implements GetRepo {
  final GitHubRepository repository;

  GetRepoImpl(this.repository);

  @override
  AsyncResult<List<Repo>> call() async => (await repository.getRepos()).fold(
        (r) {
          r.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
          return Success(r);
        },
        Failure.new,
      );
}
