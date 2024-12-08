class SocialNetworks {
  SocialNetworks({
    required this.github,
    required this.linkedin,
    required this.twitter,
    required this.instagram,
    required this.youtube,
    required this.facebook,
  });

  late final String? github;
  late final String? linkedin;
  late final String? twitter;
  late final String? instagram;
  late final String? youtube;
  late final String? facebook;

  SocialNetworks.fromJson(Map<String, dynamic> json) {
    github = json['github'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['github'] = github;
    _data['linkedin'] = linkedin;
    _data['twitter'] = twitter;
    _data['instagram'] = instagram;
    _data['youtube'] = youtube;
    _data['facebook'] = facebook;
    return _data;
  }
}
