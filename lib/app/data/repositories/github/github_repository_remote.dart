import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../../config/constants.dart';
import '../../../domain/entities/github/repo.dart';
import '../../../domain/entities/github/user.dart';
import '../../../domain/errors/github_errors.dart';
import 'github_repository.dart';

class GithubRepositoryRemote implements GitHubRepository {
  final Dio dio;

  GithubRepositoryRemote({required this.dio});

  @override
  AsyncResult<List<Repo>> getRepos() async {
    try {
      final response = await dio.get(gitHubApiRepo);
      return Success(response.data.map<Repo>((e) => Repo.fromJson(e)).toList());
    } on DioException catch (e, stackTrace) {
      Logger().e("Erro ao buscar repositórios", error: e, stackTrace: stackTrace);
      return Failure(ErrorGetRepo(message: e.message ?? "Erro ao buscar repositórios"));
    }
  }

  @override
  AsyncResult<User> getUser() async {
    try {
      final response = await dio.get(gitHubApi);
      return Success(User.fromJson(response.data));
    } on DioException catch (e, stackTrace) {
      Logger().e("Erro ao buscar repositórios", error: e, stackTrace: stackTrace);
      return Failure(ErrorGetUser(message: e.message ?? "Erro ao buscar usuário"));
    }
  }
}
