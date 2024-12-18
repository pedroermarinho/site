import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../../config/assets_path.dart';
import '../../../domain/entities/settings/settings.dart';
import '../../../domain/errors/settings_errors.dart';
import '../../../utils/parse_json.dart';
import 'settings_repository.dart';

class SettingsRepositoryLocal implements SettingsRepository {
  @override
  AsyncResult<Settings> getSettings() async {
    try {
      final file = File(AssetsPath.settingsJSON);
      final data = await json.decode(file.readAsStringSync());
      final settings = parseJson(data, Settings.fromJson);
      return Success(settings);
    } on FormatException catch (e) {
      Logger().e(e);
      return Failure(ErrorGetSettings(message: "Erro no formato dos dados recebidos"));
    } on Exception catch (e) {
      Logger().e(e);
      return Failure(ErrorGetSettings(message: "Erro ao carregar as configurações local"));
    }
  }
}
