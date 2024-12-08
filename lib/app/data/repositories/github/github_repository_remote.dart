import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/github/repo.dart';
import '../../../domain/entities/github/user.dart';
import '../../../domain/errors/github_errors.dart';
import '../../../domain/errors/settings_errors.dart';
import '../../../domain/use_cases/get_settings.dart';
import 'github_repository.dart';

class GithubRepositoryRemote implements GitHubRepository {
  final Dio dio;
  final GetSettings getSettings;

  GithubRepositoryRemote({required this.dio, required this.getSettings});

  @override
  Future<Either<ErrorGetRepo, List<Repo>>> getRepos() async {
    try {
      final settings = (await getSettings()).fold((l) => throw l, (r) => r);
      if (settings.socialNetworks.github == null) {
        return Left(ErrorGetRepo(message: "Github não configurado"));
      }
      final response = await dio.get('https://api.github.com/users/${settings.socialNetworks.github}/repos?type=public&sort=full_name&per_page=100');
      return Right(response.data.map<Repo>((e) => Repo.fromJson(e)).toList());
    } on ErrorGetSettings catch (e) {
      Logger().e(e);
      return Left(ErrorGetRepo(message: e.message));
    } on DioError catch (e) {
      Logger().e(e);
      return Left(ErrorGetRepo(message: e.message ?? "Erro ao buscar repositórios"));
    }
  }

  @override
  Future<Either<ErrorGetUser, User>> getUser() async {
    try {
      final settings = (await getSettings()).fold((l) => throw l, (r) => r);
      if (settings.socialNetworks.github == null) {
        return Left(ErrorGetUser(message: "Github não configurado"));
      }
      final response = await dio.get('https://api.github.com/users/${settings.socialNetworks.github}');
      return Right(User.fromJson(response.data));
    } on ErrorGetSettings catch (e) {
      Logger().e(e);
      return Left(ErrorGetUser(message: e.message));
    } on DioError catch (e) {
      Logger().e(e);
      return Left(ErrorGetUser(message: e.message ?? "Erro ao buscar usuário"));
    }
  }
}
