import 'package:result_dart/result_dart.dart';

import '../../data/repositories/settings/settings_repository.dart';
import '../entities/settings/settings.dart';

abstract class GetSettings {
  AsyncResult<Settings> call();
}

class GetSettingsImpl implements GetSettings {
  final SettingsRepository repository;

  GetSettingsImpl(this.repository);

  @override
  AsyncResult<Settings> call() async => await repository.getSettings();
}
