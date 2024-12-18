class Languages {
  Languages({
    required this.name,
    required this.level,
  });

  late final String name;
  late final String level;

  Languages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['level'] = level;
    return _data;
  }
}
