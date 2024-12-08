class License {
  License({
    required this.key,
    required this.name,
  });

  late final String key;
  late final String name;

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['name'] = name;
    return _data;
  }
}
