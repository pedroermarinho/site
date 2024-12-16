class Roles {
  Roles({
    required this.role,
    required this.location,
    required this.startDate,
    required this.skills,
    this.endDate,
  });

  late final String role;
  late final String location;
  late final String startDate;
  late final String? endDate;
  late final List<String> skills;

  Roles.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    skills = List.castFrom<dynamic, String>(json['skills']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['role'] = role;
    _data['location'] = location;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['skills'] = skills;
    return _data;
  }
}
