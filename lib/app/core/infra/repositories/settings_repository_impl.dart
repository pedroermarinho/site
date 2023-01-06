import 'package:dartz/dartz.dart';

import '../../domain/entities/settings/settings.dart';
import '../../domain/errors/settings_errors.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource dataSource;

  SettingsRepositoryImpl(this.dataSource);

  @override
  Future<Either<SettingsFailure, Settings>> getSettings() async {
    return await dataSource.getSettings();
  }
}
