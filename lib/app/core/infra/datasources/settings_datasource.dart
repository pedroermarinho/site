import 'package:dartz/dartz.dart';

import '../../domain/entities/settings/settings.dart';
import '../../domain/errors/settings_errors.dart';

abstract class SettingsDataSource {
  Future<Either<SettingsFailure, Settings>> getSettings();
}
