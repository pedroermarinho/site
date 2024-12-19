import 'roles.dart';

class WorkExperience {
  WorkExperience({
    required this.companyName,
    required this.details,
    required this.roles,
  });

  late final String companyName;
  late final List<String> details;
  late final List<Roles> roles;

  WorkExperience.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    details = List<String>.from(json['details']);
    roles = List.from(json['roles']).map((e) => Roles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['companyName'] = companyName;
    _data['details'] = details;
    _data['roles'] = roles.map((e) => e.toJson()).toList();
    return _data;
  }
}
