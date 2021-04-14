import 'constants.dart';

class GitHubUtils {
  static String getGithubUrlRepository(String repository) =>
      "${Constants.rawGitHub}/$repository/master/readme.json";
}
