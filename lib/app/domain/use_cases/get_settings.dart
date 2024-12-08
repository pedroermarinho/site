import 'package:dartz/dartz.dart';

import '../../data/repositories/settings/settings_repository.dart';
import '../entities/settings/settings.dart';
import '../errors/settings_errors.dart';

abstract class GetSettings {
  Future<Either<SettingsFailure, Settings>> call();
}

class GetSettingsImpl implements GetSettings {
  final SettingsRepository repository;

  GetSettingsImpl(this.repository);

  @override
  Future<Either<SettingsFailure, Settings>> call() async => await repository.getSettings();
}
