import 'package:dio/dio.dart';
import '../../../../../core/presenter/utils/constants.dart';
import '../../../../../core/presenter/utils/github_utils.dart';

import 'github_repository_interface.dart';

class GithubRepository extends IGithubRepository {
  @override
  Future<Response> getDataGitHubRepos(String repository) async {
    try {
      final response =
          await Dio().get(GitHubUtils.getGithubUrlRepository(repository));
      return response;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Response> getGitHubRepos() async {
    try {
      final response = await Dio().get(Constants.apiGitHub);
      return response;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw Exception();
    }
  }
}
