import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../../config/constants.dart';
import '../../../domain/entities/settings/settings.dart';
import '../../../domain/errors/generic_errors.dart';
import '../../../domain/errors/settings_errors.dart';
import '../../../utils/parse_json.dart';
import 'settings_repository.dart';

class SettingsRepositoryRemote implements SettingsRepository {
  final Dio dio;

  SettingsRepositoryRemote({required this.dio});

  @override
  AsyncResult<Settings> getSettings() async {
    try {
      final response = await dio.get(settingsUrl);
      final data = await json.decode(response.data);
      final settings = parseJson(data, Settings.fromJson);
      return Success(settings);
    } on DioException catch (e) {
      Logger().e(e);
      return Failure(ErrorGetSettings(message: e.message ?? "Erro ao buscar configurações remoto"));
    } on FormatFailure catch (e, stackTrace) {
      Logger().e("Erro no formato dos dados recebidos", error: e, stackTrace: stackTrace);
      return Failure(ErrorGetSettings(message: "Erro no formato dos dados recebidos"));
    } on Exception catch (e) {
      Logger().e(e);
      return Failure(ErrorGetSettings(message: "Erro ao carregar as configurações remoto"));
    }
  }
}
