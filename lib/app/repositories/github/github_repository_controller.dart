import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:site/app/repositories/github/repository/github_repository.dart';
import 'package:site/app/repositories/github/repository/github_repository_interface.dart';

part 'github_repository_controller.g.dart';

class GithubRepositoryController = _GithubRepositoryControllerBase
    with _$GithubRepositoryController;

abstract class _GithubRepositoryControllerBase with Store {
  final _githubRepository = GithubRepository();

  Future<Response> getDataGitHubRepos(String repository) {
    return _githubRepository.getDataGitHubRepos(repository);
  }

  Future<Response> getGitHubRepos() async {
    return _githubRepository.getGitHubRepos();
  }
}
