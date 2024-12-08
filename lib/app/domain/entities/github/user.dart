class User {
  User({
    required this.login,
    required this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
  });

  late final String login;
  late final String bio;
  late final int publicRepos;
  late final int publicGists;
  late final int followers;
  late final int following;

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['bio'] = bio;
    _data['public_repos'] = publicRepos;
    _data['public_gists'] = publicGists;
    _data['followers'] = followers;
    _data['following'] = following;
    return _data;
  }
}
