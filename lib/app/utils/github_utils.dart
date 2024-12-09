import '../config/environment.dart';

String getGithubUrlRepository(String repository) => "$rawGitHub/$repository/master/readme.json";
