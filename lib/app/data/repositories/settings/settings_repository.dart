import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/settings/settings.dart';

abstract class SettingsRepository {
  Future<Result<Settings>> getSettings();
}
