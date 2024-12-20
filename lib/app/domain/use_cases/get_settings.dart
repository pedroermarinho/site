import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../config/environment.dart';
import '../../data/repositories/settings/settings_repository.dart';
import '../../data/repositories/settings/settings_repository_local.dart';
import '../../data/repositories/settings/settings_repository_remote.dart';
import '../entities/settings/settings.dart';

abstract class GetSettings {
  AsyncResult<Settings> call();
}

class GetSettingsImpl implements GetSettings {
  final Dio dio;

  GetSettingsImpl({
    required this.dio,
  });

  @override
  AsyncResult<Settings> call() async {
    final result = await _command(repository(isRemote: isProduction));

    if (result.isError()) {
      final recover = await _command(repository(isRemote: !isProduction));
      return result.recover((e) {
        Logger().e("Erro ao recuperar configurações: $e", error: e);
        return recover;
      });
    }
    return result;
  }

  Future<ResultDart<Settings, Exception>> _command(SettingsRepository repository) async => await repository.getSettings();

  SettingsRepository repository({
    required bool isRemote,
  }) =>
      isRemote ? SettingsRepositoryRemote(dio: dio) : SettingsRepositoryLocal();
}
