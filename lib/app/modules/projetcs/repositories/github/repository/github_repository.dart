import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

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
    } on DioError catch (e) {
      Logger().i("url:${GitHubUtils.getGithubUrlRepository(repository)}");
      Logger().e(e);
      rethrow;
    }
  }

  @override
  Future<Response> getGitHubRepos() async {
    final response = await Dio().get(Constants.apiGitHub);
    return response;
  }
}
