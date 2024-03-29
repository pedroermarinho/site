import 'roles.dart';

class Jobs {
  Jobs({
    required this.companyName,
    required this.roles,
  });

  late final String companyName;
  late final List<Roles> roles;

  Jobs.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    roles = List.from(json['roles']).map((e) => Roles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['companyName'] = companyName;
    _data['roles'] = roles.map((e) => e.toJson()).toList();
    return _data;
  }
}
