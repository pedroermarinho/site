import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/theme/theme_enum.dart';

abstract class ThemeRepository {
  Future<Result<ThemeEnum>> getTheme();

  Future<Result<Unit>> setTheme(ThemeEnum themeEnum);
}
