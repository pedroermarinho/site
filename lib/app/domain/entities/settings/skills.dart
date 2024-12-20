class Skills {
  Skills({
    required this.primary,
    required this.secondary,
  });

  final SkillCategory primary;
  final SkillCategory secondary;

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
        primary: SkillCategory.fromJson(json['primary']),
        secondary: SkillCategory.fromJson(json['secondary']),
      );

  Map<String, dynamic> toJson() => {
        'primary': primary.toJson(),
        'secondary': secondary.toJson(),
      };

  List<String> get allSkills => [
        ...primary.languages,
        ...primary.frameworks,
        ...primary.tools,
        ...primary.platforms,
        ...primary.databases,
        ...primary.os,
        ...secondary.languages,
        ...secondary.frameworks,
        ...secondary.tools,
        ...secondary.platforms,
        ...secondary.databases,
        ...secondary.os,
      ];
}

class SkillCategory {
  SkillCategory({
    required this.languages,
    required this.frameworks,
    required this.tools,
    required this.platforms,
    required this.databases,
    required this.os,
  });

  final List<String> languages;
  final List<String> frameworks;
  final List<String> tools;
  final List<String> platforms;
  final List<String> databases;
  final List<String> os;

  factory SkillCategory.fromJson(Map<String, dynamic> json) => SkillCategory(
        languages: List<String>.from(json['languages'] ?? []),
        frameworks: List<String>.from(json['frameworks'] ?? []),
        tools: List<String>.from(json['tools'] ?? []),
        platforms: List<String>.from(json['platforms'] ?? []),
        databases: List<String>.from(json['databases'] ?? []),
        os: List<String>.from(json['os'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'languages': languages,
        'frameworks': frameworks,
        'tools': tools,
        'platforms': platforms,
        'databases': databases,
        'os': os,
      };
}
