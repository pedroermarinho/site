import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../../config/environment.dart';
import '../../../domain/entities/settings/settings.dart';
import '../../../domain/errors/settings_errors.dart';
import 'settings_repository.dart';

class SettingsRepositoryRemote implements SettingsRepository {
  final Dio dio;

  SettingsRepositoryRemote({required this.dio});

  @override
  Future<Result<Settings>> getSettings() async {
    try {
      final response = await dio.get(settingsUrl);
      final data = await json.decode(response.data);
      final settings = Settings.fromJson(data);
      return Success(settings);
    } on DioException catch (e) {
      Logger().e(e);
      return Failure(ErrorGetSettings(message: e.message ?? "Erro ao buscar configurações"));
    } on Exception catch (_) {
      return Failure(ErrorGetSettings(message: "Erro ao carregar as configurações"));
    }
  }
}
