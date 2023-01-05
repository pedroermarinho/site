class ReadmeModel {
  String? projectName;
  String? version;
  String? description;
  String? iconSrc;
  String? snapStoreName;
  List<String>? screenshotSrc;
  String? author;
  String? githubUsername;
  String? authorLinkedinUsername;
  String? authorTwitterUsername;
  String? authorWebsite;
  String? homepage;
  String? projectDemoUrl;
  String? repositoryUrl;
  String? contributingUrl;
  String? documentationUrl;
  String? licenseUrl;
  String? issuesUrl;
  String? license;
  List<String>? installCommand;
  List<String>? usageCommand;
  List<String>? testCommand;
  Repository? repository;
  List<Credits>? credits;
  List<String>? keywords;
  bool? isGithubRepos;
  bool? hasStartCommand;
  bool? hasTestCommand;

  ReadmeModel(
      {this.projectName,
      this.version,
      this.description,
      this.iconSrc,
      this.snapStoreName,
      this.screenshotSrc,
      this.author,
      this.githubUsername,
      this.authorLinkedinUsername,
      this.authorTwitterUsername,
      this.authorWebsite,
      this.homepage,
      this.projectDemoUrl,
      this.repositoryUrl,
      this.contributingUrl,
      this.documentationUrl,
      this.licenseUrl,
      this.issuesUrl,
      this.license,
      this.installCommand,
      this.usageCommand,
      this.testCommand,
      this.repository,
      this.credits,
      this.keywords,
      this.isGithubRepos,
      this.hasStartCommand,
      this.hasTestCommand});

  factory ReadmeModel.fromJson(Map<String, dynamic> json) => ReadmeModel(
        projectName: json['project_name'].toString(),
        version: json['version'],
        description: json['description'].toString(),
        iconSrc: json['icon_src'],
        snapStoreName: json['snap_store_name'],
        screenshotSrc: json['screenshot_src'].cast<String>(),
        author: json['author'],
        githubUsername: json['github_username'],
        authorLinkedinUsername: json['author_linkedin_username'],
        authorTwitterUsername: json['author_twitter_username'],
        authorWebsite: json['author_website'],
        homepage: json['homepage'],
        projectDemoUrl: json['project_demo_url'],
        repositoryUrl: json['repository_url'].toString(),
        contributingUrl: json['contributing_url'],
        documentationUrl: json['documentation_url'],
        licenseUrl: json['license_url'],
        issuesUrl: json['issues_url'],
        license: json['license'],
        installCommand: json['install_command']?.cast<String>() ?? null,
        usageCommand: json['usage_command']?.cast<String>() ?? null,
        testCommand: json['test_command']?.cast<String>() ?? null,
        repository: json['repository'] != null
            ? Repository.fromJson(json['repository'])
            : null,
        credits: json['credits'] != null
            ? <Credits>[]
            : _setCredits(json['credits']),
        keywords: json['keywords']?.cast<String>() ?? null,
        isGithubRepos: json['is_github_repos'],
        hasStartCommand: json['has_start_command'],
        hasTestCommand: json['has_test_command'],
      );

  static List<Credits> _setCredits(var data) {
    var credits = <Credits>[];
    if (data != null) {
      for (var item in data) {
        credits.add(Credits.fromJson(item));
      }
    }
    return credits;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project_name'] = projectName;
    data['version'] = version;
    data['description'] = description;
    data['icon_src'] = iconSrc;
    data['snap_store_name'] = snapStoreName;
    data['screenshot_src'] = screenshotSrc;
    data['author'] = author;
    data['github_username'] = githubUsername;
    data['author_linkedin_username'] = authorLinkedinUsername;
    data['author_twitter_username'] = authorTwitterUsername;
    data['author_website'] = authorWebsite;
    data['homepage'] = homepage;
    data['project_demo_url'] = projectDemoUrl;
    data['repository_url'] = repositoryUrl;
    data['contributing_url'] = contributingUrl;
    data['documentation_url'] = documentationUrl;
    data['license_url'] = licenseUrl;
    data['issues_url'] = issuesUrl;
    data['license'] = license;
    data['install_command'] = installCommand;
    data['usage_command'] = usageCommand;
    data['test_command'] = testCommand;
    if (repository != null) {
      data['repository'] = repository?.toJson();
    }
    if (credits != null) {
      data['credits'] = credits?.map((v) => v.toJson()).toList();
    }
    data['keywords'] = keywords;
    data['is_github_repos'] = isGithubRepos;
    data['has_start_command'] = hasStartCommand;
    data['has_test_command'] = hasTestCommand;
    return data;
  }
}

class Repository {
  String? type;
  String? url;

  Repository({this.type, this.url});

  factory Repository.fromJson(Map<String, dynamic> json) =>
      Repository(type: json['type'], url: json['url']);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class Credits {
  String? name;
  String? url;

  Credits({this.name, this.url});

  factory Credits.fromJson(Map<String, dynamic> json) =>
      Credits(name: json['name'], url: json['url']);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
