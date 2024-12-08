import 'license.dart';

class Repo {
  Repo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.createdAt,
    required this.updatedAt,
    required this.homepage,
    required this.size,
    required this.language,
    required this.archived,
    required this.license,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
    required this.stargazersCount,
  });

  late final int id;
  late final String name;
  late final String fullName;
  late final bool private;
  late final String htmlUrl;
  late final String? description;
  late final bool fork;
  late final String createdAt;
  late final String updatedAt;
  late final String? homepage;
  late final int size;
  late final String? language;
  late final bool archived;
  late final License? license;
  late final List<String> topics;
  late final String visibility;
  late final int forks;
  late final int openIssues;
  late final int watchers;
  late final String defaultBranch;
  late final int stargazersCount;

  Repo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homepage = json['homepage'];
    size = json['size'];
    language = json['language'];
    archived = json['archived'];
    license = json['license'] == null ? null : License.fromJson(json['license']);
    topics = List.castFrom<dynamic, String>(json['topics']);
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
    stargazersCount = json['stargazers_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['full_name'] = fullName;
    _data['private'] = private;
    _data['html_url'] = htmlUrl;
    _data['description'] = description;
    _data['fork'] = fork;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['homepage'] = homepage;
    _data['size'] = size;
    _data['language'] = language;
    _data['archived'] = archived;
    _data['license'] = license?.toJson();
    _data['topics'] = topics;
    _data['visibility'] = visibility;
    _data['forks'] = forks;
    _data['open_issues'] = openIssues;
    _data['watchers'] = watchers;
    _data['default_branch'] = defaultBranch;
    _data['stargazers_count'] = stargazersCount;
    return _data;
  }
}
