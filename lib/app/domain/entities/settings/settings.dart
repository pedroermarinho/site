import 'academic.dart';
import 'languages.dart';
import 'links.dart';
import 'phone.dart';
import 'projects.dart';
import 'skills.dart';
import 'social_links.dart';
import 'work_experience.dart';

class Settings {
  Settings({
    required this.name,
    required this.fullName,
    required this.birthDate,
    required this.email,
    required this.role,
    required this.location,
    required this.photo,
    required this.summary,
    required this.phone,
    required this.socialLinks,
    required this.academic,
    required this.languages,
    required this.workExperience,
    required this.skills,
    required this.links,
    required this.projects,
  });

  late final String name;
  late final String fullName;
  late final String birthDate;
  late final String email;
  late final String role;
  late final String location;
  late final String photo;
  late final String summary;
  late final SocialLinks socialLinks;
  late final Phone phone;
  late final List<Academic> academic;
  late final List<Languages> languages;
  late final List<WorkExperience> workExperience;
  late final Skills skills;
  late final List<Links> links;
  late final List<Projects> projects;

  Settings.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['fullName'];
    birthDate = json['birthDate'];
    email = json['email'];
    role = json['role'];
    location = json['location'];
    photo = json['photo'];
    summary = json['summary'];
    phone = Phone.fromJson(json['phone']);
    socialLinks = SocialLinks.fromJson(json['socialLinks']);
    academic = List.from(json['academic']).map((e) => Academic.fromJson(e)).toList();
    languages = List.from(json['languages']).map((e) => Languages.fromJson(e)).toList();
    workExperience = List.from(json['workExperience']).map((e) => WorkExperience.fromJson(e)).toList();
    skills = Skills.fromJson(json['skills']);
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    projects = List.from(json['projects']).map((e) => Projects.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['fullName'] = fullName;
    _data['birthDate'] = birthDate;
    _data['email'] = email;
    _data['role'] = role;
    _data['location'] = location;
    _data['photo'] = photo;
    _data['summary'] = summary;
    _data['phone'] = phone.toJson();
    _data['socialLinks'] = socialLinks.toJson();
    _data['academic'] = academic.map((e) => e.toJson()).toList();
    _data['languages'] = languages.map((e) => e.toJson()).toList();
    _data['workExperience'] = workExperience.map((e) => e.toJson()).toList();
    _data['skills'] = skills.toJson();
    _data['links'] = links.map((e) => e.toJson()).toList();
    _data['projects'] = projects.map((e) => e.toJson()).toList();
    return _data;
  }
}
