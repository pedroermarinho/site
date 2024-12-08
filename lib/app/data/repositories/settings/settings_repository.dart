import 'package:dartz/dartz.dart';

import '../../../domain/entities/settings/settings.dart';
import '../../../domain/errors/settings_errors.dart';

abstract class SettingsRepository {
  Future<Either<SettingsFailure, Settings>> getSettings();
}
