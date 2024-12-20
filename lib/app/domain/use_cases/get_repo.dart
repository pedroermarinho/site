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
        (repos) {
          repos.sort((a, b) {
            final starComparison = b.stargazersCount.compareTo(a.stargazersCount);
            if (starComparison != 0) {
              return starComparison;
            }

            final forkComparison = (!b.fork ? 1 : 0).compareTo(!a.fork ? 1 : 0);

            if (forkComparison != 0) {
              return forkComparison;
            }

            final descriptionComparison = (b.description != null ? 1 : 0)
                .compareTo(a.description != null ? 1 : 0);

            if (descriptionComparison != 0) {
              return descriptionComparison;
            }

            final topicComparison = (b.topics.isNotEmpty ? 1 : 0)
                .compareTo(a.topics.isNotEmpty ? 1 : 0);

            if (topicComparison != 0) {
              return topicComparison;
            }

            return a.name.compareTo(b.name);
          });
          return Success(repos);
        },
        Failure.new,
      );
}
