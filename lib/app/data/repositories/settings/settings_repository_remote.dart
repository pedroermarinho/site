import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../config/environment.dart';
import '../../../domain/entities/settings/settings.dart';
import '../../../domain/errors/settings_errors.dart';
import 'settings_repository.dart';

class SettingsRepositoryRemote implements SettingsRepository {
  final Dio dio;

  SettingsRepositoryRemote({required this.dio});

  @override
  Future<Either<SettingsFailure, Settings>> getSettings() async {
    try {
      final response = await dio.get(settingsUrl);
      final data = await json.decode(response.data);
      final settings = Settings.fromJson(data);
      return Right(settings);
    } on DioError catch (e) {
      Logger().e(e);
      return Left(ErrorGetSettings(message: e.message ?? "Erro ao buscar configurações"));
    } on Exception catch (_) {
      return Left(ErrorGetSettings(message: "Erro ao carregar as configurações"));
    }
  }
}
