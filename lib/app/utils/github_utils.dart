import '../config/constants.dart';

String getGithubUrlRepository(String repository) => "${Constants.rawGitHub}/$repository/master/readme.json";
