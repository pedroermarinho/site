import 'package:dartz/dartz.dart';

import '../entities/settings/settings.dart';
import '../errors/settings_errors.dart';
import '../repositories/settings_repository.dart';

abstract class GetSettings {
  Future<Either<SettingsFailure, Settings>> call();
}

class GetSettingsImpl implements GetSettings {
  final SettingsRepository repository;

  GetSettingsImpl(this.repository);

  @override
  Future<Either<SettingsFailure, Settings>> call() async =>
      await repository.getSettings();
}
