import 'package:result_dart/result_dart.dart';

import '../../data/repositories/settings/settings_repository.dart';
import '../entities/settings/settings.dart';

abstract class GetSettings {
  AsyncResult<Settings> call([SettingsRepository? optionalRepository]);
}

class GetSettingsImpl implements GetSettings {
  final SettingsRepository repository;

  GetSettingsImpl(this.repository);

  @override
  AsyncResult<Settings> call([SettingsRepository? optionalRepository]) async {
    final repository = optionalRepository ?? this.repository;
    return await repository.getSettings();
  }
}
