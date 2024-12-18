import 'environment.dart';

const String keyTheme = 'theme';

final String rawGitHub = 'https://raw.githubusercontent.com/$gitHubUsername';

final String apiGitHub = 'https://api.github.com/users/$gitHubUsername/repos';

final settingsUrl = 'https://raw.githubusercontent.com/$gitHubUsername/site/master/assets/settings.json';

final String gitHubApi = 'https://api.github.com/users/$gitHubUsername';

final String gitHubApiRepo = '$gitHubApi/repos?type=public&sort=full_name&per_page=100';

String getGithubUrlRepository(String gitHubUsername, String repository) => "$rawGitHub/$repository/master/readme.json";

String projectImgUrl(String gitHubUsername, String projectName, String imgSrc) => "$rawGitHub/$projectName/master/$imgSrc";
