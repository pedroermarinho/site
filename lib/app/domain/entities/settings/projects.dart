class Projects {
  Projects({
    required this.name,
    required this.description,
    required this.url,
    required this.github,
    required this.snap,
    required this.pypi,
  });

  late final String name;
  late final String description;
  late final String url;
  late final String? github;
  late final String? snap;
  late final String? pypi;

  Projects.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
    github = json['github'];
    snap = json['snap'];
    pypi = json['pypi'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['url'] = url;
    _data['github'] = github;
    _data['snap'] = snap;
    _data['pypi'] = pypi;
    return _data;
  }
}
