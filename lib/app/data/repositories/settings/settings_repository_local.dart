import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../../config/assets_path.dart';
import '../../../domain/entities/settings/settings.dart';
import '../../../domain/errors/settings_errors.dart';
import 'settings_repository.dart';

class SettingsRepositoryLocal implements SettingsRepository {
  @override
  Future<Result<Settings>> getSettings() async {
    try {
      final file = File(AssetsPath.settingsJSON);
      final data = await json.decode(file.readAsStringSync());
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
