import 'package:logger/logger.dart';

class Projects {
  Projects({
    required this.name,
    required this.description,
    required this.skills,
    required this.images,
    required this.type,
    required this.status,
    this.links,
    this.markdown,
    this.startDate,
    this.endDate,
  });

  final String name;
  final String description;
  final List<String> skills;
  final List<String> images;
  final ProjectType type;
  final ProjectStatus status;
  final ProjectLinks? links;
  final String? markdown;
  final String? startDate;
  final String? endDate;

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        name: json['name'],
        description: json['description'],
        skills: List<String>.from(json['skills']),
        images: List<String>.from(json['images'] ?? []),
        type: _parseProjectType(json['type']),
        status: _parseProjectStatus(json['status']),
        links: json['links'] != null ? ProjectLinks.fromJson(json['links']) : null,
        markdown: json['markdown'],
        startDate: json['startDate'],
        endDate: json['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'skills': skills,
        'images': images,
        'type': type.name,
        'status': status.name,
        if (links != null) 'links': links!.toJson(),
        if (markdown != null) 'markdown': markdown,
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      };

  static ProjectType _parseProjectType(String type) {
    switch (type) {
      case 'personal':
        return ProjectType.personal;
      case 'professional':
        return ProjectType.professional;
      default:
        Logger().e("ProjectType not found: $type");
        return ProjectType.personal;
    }
  }

  static ProjectStatus _parseProjectStatus(String status) {
    switch (status) {
      case 'in_progress':
        return ProjectStatus.inProgress;
      case 'paused':
        return ProjectStatus.paused;
      case 'completed':
        return ProjectStatus.completed;
      case 'archived':
        return ProjectStatus.archived;
      default:
        Logger().e("ProjectStatus not found: $status");
        return ProjectStatus.completed;
    }
  }
}

enum ProjectType { personal, professional }

enum ProjectStatus { inProgress, paused, completed, archived }

class ProjectLinks {
  ProjectLinks({
    this.github,
    this.snap,
    this.site,
    this.pypi,
  });

  final String? github;
  final String? snap;
  final String? site;
  final String? pypi;

  factory ProjectLinks.fromJson(Map<String, dynamic> json) => ProjectLinks(
        github: json['github'],
        snap: json['snap'],
        site: json['site'],
        pypi: json['pypi'],
      );

  Map<String, dynamic> toJson() => {
        if (github != null && github!.isNotEmpty) 'github': github,
        if (snap != null && snap!.isNotEmpty) 'snap': snap,
        if (site != null && site!.isNotEmpty) 'site': site,
        if (pypi != null && pypi!.isNotEmpty) 'pypi': pypi,
      };
}
