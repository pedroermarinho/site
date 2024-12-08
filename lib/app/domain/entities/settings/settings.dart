import 'academic.dart';
import 'jobs.dart';
import 'links.dart';
import 'phone.dart';
import 'projects.dart';
import 'skills.dart';
import 'social_networks.dart';

class Settings {
  Settings({
    required this.name,
    required this.email,
    required this.role,
    required this.location,
    required this.photo,
    required this.phone,
    required this.socialNetworks,
    required this.academic,
    required this.languages,
    required this.jobs,
    required this.skills,
    required this.links,
    required this.projects,
  });

  late final String name;
  late final String email;
  late final String role;
  late final String location;
  late final String photo;
  late final SocialNetworks socialNetworks;
  late final Phone phone;
  late final List<Academic> academic;
  late final List<Skills> languages;
  late final List<Jobs> jobs;
  late final List<Skills> skills;
  late final List<Links> links;
  late final List<Projects> projects;

  Settings.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    location = json['location'];
    photo = json['photo'];
    phone = Phone.fromJson(json['phone']);
    socialNetworks = SocialNetworks.fromJson(json['socialNetworks']);
    academic = List.from(json['academic']).map((e) => Academic.fromJson(e)).toList();
    languages = List.from(json['languages']).map((e) => Skills.fromJson(e)).toList();
    jobs = List.from(json['jobs']).map((e) => Jobs.fromJson(e)).toList();
    skills = List.from(json['skills']).map((e) => Skills.fromJson(e)).toList();
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    projects = List.from(json['projects']).map((e) => Projects.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['role'] = role;
    _data['location'] = location;
    _data['photo'] = photo;
    _data['phone'] = phone.toJson();
    _data['socialNetworks'] = socialNetworks.toJson();
    _data['academic'] = academic.map((e) => e.toJson()).toList();
    _data['languages'] = languages.map((e) => e.toJson()).toList();
    _data['jobs'] = jobs.map((e) => e.toJson()).toList();
    _data['skills'] = skills.map((e) => e.toJson()).toList();
    _data['links'] = links.map((e) => e.toJson()).toList();
    _data['projects'] = projects.map((e) => e.toJson()).toList();
    return _data;
  }
}
