import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/github/repo.dart';
import '../../../domain/entities/github/user.dart';

abstract class GitHubRepository {
  Future<Result<List<Repo>>> getRepos();

  Future<Result<User>> getUser();
}
