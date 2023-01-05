import 'package:dartz/dartz.dart';

import '../entities/settings/settings.dart';
import '../errors/settings_errors.dart';

abstract class SettingsRepository {
  Future<Either<SettingsFailure, Settings>> getSettings();
}
