import 'package:dio/dio.dart';
import 'package:site/app/repositories/github/repository/github_repository_interface.dart';
import 'package:site/app/shared/config/constants.dart';
import 'package:site/app/shared/utils/github_utils.dart';

class GithubRepository extends IGithubRepository {
  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  @override
  Future<Response> getDataGitHubRepos(String repository) async {
    try {
//      print(GitHubUtils.getGithubUrlRepository(repository));
      Response response =
          await Dio().get(GitHubUtils.getGithubUrlRepository(repository));
//      print(response);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Response> getGitHubRepos() async {
    try {
      Response response = await Dio().get(Constants.API_GITHUB);
//      print(response);
      return response;
    } catch (e) {
      return null;
    }
  }
}
